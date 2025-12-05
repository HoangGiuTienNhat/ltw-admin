<?php
include 'config.php';

try {
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM products");
    $totalProducts = $stmt->fetch()['total'];

    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders");
    $totalOrders = $stmt->fetch()['total'];

    $stmt = $pdo->query("SELECT COUNT(*) as total FROM users");
    $totalUsers = $stmt->fetch()['total'];

    $stmt = $pdo->query("SELECT o.id, o.order_number, o.total_amount, o.status, o.created_at, u.full_name FROM orders o JOIN users u ON o.user_id = u.id ORDER BY o.created_at DESC LIMIT 10");
    $recentOrders = $stmt->fetchAll();

    $stmt = $pdo->query("SELECT id, name, price, image FROM products ORDER BY created_at DESC LIMIT 5");
    $recentProducts = $stmt->fetchAll();

    $stmt = $pdo->query("SELECT DATE(created_at) as date, COUNT(*) as count FROM users GROUP BY DATE(created_at) ORDER BY date");
    $userCreationData = $stmt->fetchAll();

    $cumulative = 0;
    $dates = [];
    $data = [];
    foreach ($userCreationData as $row) {
        $cumulative += $row['count'];
        $dates[] = $row['date'];
        $data[] = $cumulative;
    }

    // Total revenue
    $stmt = $pdo->query("SELECT SUM(total_amount) as total_revenue FROM orders");
    $totalRevenue = $stmt->fetch()['total_revenue'] ?? 0;

    // Recent reviews
    $stmt = $pdo->query("SELECT user_name as name, comment as message, created_at FROM reviews ORDER BY created_at DESC LIMIT 20");
    $reviews = $stmt->fetchAll();

    // Chart data for the last 30 days
    $stmt = $pdo->query("
        SELECT
            DATE(created_at) as date,
            COUNT(*) as users_count
        FROM users
        WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY DATE(created_at)
        ORDER BY date
    ");
    $userChartData = $stmt->fetchAll();

    $stmt = $pdo->query("
        SELECT
            DATE(created_at) as date,
            COUNT(*) as orders_count
        FROM orders
        WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY DATE(created_at)
        ORDER BY date
    ");
    $orderChartData = $stmt->fetchAll();

    $stmt = $pdo->query("
        SELECT
            DATE(created_at) as date,
            COUNT(*) as contacts_count
        FROM contacts
        WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY DATE(created_at)
        ORDER BY date
    ");
    $contactChartData = $stmt->fetchAll();

    // Generate chart data arrays
    $chartDates = [];
    $userChartValues = [];
    $orderChartValues = [];
    $contactChartValues = [];

    // Create date range for last 30 days
    for ($i = 29; $i >= 0; $i--) {
        $date = date('Y-m-d', strtotime("-$i days"));
        $chartDates[] = $date;

        // Users data
        $userCount = 0;
        foreach ($userChartData as $row) {
            if ($row['date'] === $date) {
                $userCount = (int)$row['users_count'];
                break;
            }
        }
        $userChartValues[] = $userCount;

        // Orders data
        $orderCount = 0;
        foreach ($orderChartData as $row) {
            if ($row['date'] === $date) {
                $orderCount = (int)$row['orders_count'];
                break;
            }
        }
        $orderChartValues[] = $orderCount;

        // Contacts data
        $contactCount = 0;
        foreach ($contactChartData as $row) {
            if ($row['date'] === $date) {
                $contactCount = (int)$row['contacts_count'];
                break;
            }
        }
        $contactChartValues[] = $contactCount;
    }

    // User registration sources (for donut chart)
    $stmt = $pdo->query("
        SELECT
            CASE
                WHEN referrer LIKE '%google%' THEN 'Search Engine'
                WHEN referrer LIKE '%facebook%' OR referrer LIKE '%twitter%' OR referrer LIKE '%instagram%' THEN 'Social Media'
                WHEN referrer IS NULL OR referrer = '' THEN 'Direct'
                ELSE 'Other'
            END as source,
            COUNT(*) as count
        FROM users
        GROUP BY source
    ");
    $userSources = $stmt->fetchAll();

    $sourceLabels = [];
    $sourceData = [];
    foreach ($userSources as $source) {
        $sourceLabels[] = $source['source'];
        $sourceData[] = (int)$source['count'];
    }

    // If no data, provide defaults
    if (empty($sourceLabels)) {
        $sourceLabels = ['Direct', 'Social Media', 'Search Engine', 'Other'];
        $sourceData = [1, 0, 0, 0];
    }

} catch (Exception $e) {
    die("Error: " . $e->getMessage());
}
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Dashboard - TechStore Admin</title>
    <link href="../dist/libs/jsvectormap/dist/jsvectormap.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-flags.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-socials.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-payments.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-vendors.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-marketing.css?1760059270" rel="stylesheet" />
    <link href="../dist/css/tabler-themes.css?1760059270" rel="stylesheet" />
    <link href="../dist/libs/apexcharts/dist/apexcharts.css?1760059270" rel="stylesheet" />
    <link href="../preview/css/demo.css?1760059270" rel="stylesheet" />
    <style>
        @import url("https://rsms.me/inter/inter.css");
    </style>
</head>
<body>
    <script src="../dist/js/tabler-theme.min.js?1760059270"></script>
    <div class="page">
        <header class="navbar navbar-expand-md d-print-none">
            <div class="container-xl">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
                    <a href="." aria-label="TechStore">
                        <svg xmlns="http://www.w3.org/2000/svg" width="110" height="32" viewBox="0 0 232 68" class="navbar-brand-image">
                            <path d="M64.6 16.2C63 9.9 58.1 5 51.8 3.4 40 1.5 28 1.5 16.2 3.4 9.9 5 5 9.9 3.4 16.2 1.5 28 1.5 40 3.4 51.8 5 58.1 9.9 63 16.2 64.6c11.8 1.9 23.8 1.9 35.6 0C58.1 63 63 58.1 64.6 51.8c1.9-11.8 1.9-23.8 0-35.6zM33.3 36.3c-2.8 4.4-6.6 8.2-11.1 11-1.5.9-3.3.9-4.8.1s-2.4-2.3-2.5-4c0-1.7.9-3.3 2.4-4.1 2.3-1.4 4.4-3.2 6.1-5.3-1.8-2.1-3.8-3.8-6.1-5.3-2.3-1.3-3-4.2-1.7-6.4s4.3-2.9 6.5-1.6c4.5 2.8 8.2 6.5 11.1 10.9 1 1.4 1 3.3.1 4.7zM49.2 46H37.8c-2.1 0-3.8-1-3.8-3s1.7-3 3.8-3h11.4c2.1 0 3.8 1 3.8 3s-1.7 3-3.8 3z" fill="#066fd1" style="fill: var(--tblr-primary, #066fd1)"/>
                            <path d="M105.8 46.1c.4 0 .9.2 1.2.6s.6 1 .6 1.7c0 .9-.5 1.6-1.4 2.2s-2 .9-3.2.9c-2 0-3.7-.4-5-1.3s-2-2.6-2-5.4V31.6h-2.2c-.8 0-1.4-.3-1.9-.8s-.9-1.1-.9-1.9c0-.7.3-1.4.8-1.8s1.2-.7 1.9-.7h2.2v-3.1c0-.8.3-1.5.8-2.1s1.3-.8 2.1-.8 1.5.3 2 .8.8 1.3.8 2.1v3.1h3.4c.8 0 1.4.3 1.9.8s.8 1.2.8 1.9-.3 1.4-.8 1.8-1.2.7-1.9.7h-3.4v13c0 .7.2 1.2.5 1.5s.8.5 1.4.5c.3 0 .6-.1 1.1-.2.5-.2.8-.3 1.2-.3zm28-20.7c.8 0 1.5.3 2.1.8.5.5.8 1.2.8 2.1v20.3c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2-.8-.8-1.2-.8-2.1c-.8.9-1.9 1.7-3.2 2.4-1.3.7-2.8 1-4.3 1-2.2 0-4.2-.6-6-1.7-1.8-1.1-3.2-2.7-4.2-4.7s-1.6-4.3-1.6-6.9c0-2.6.5-4.9 1.5-6.9s2.4-3.6 4.2-4.8c1.8-1.1 3.7-1.7 5.9-1.7 1.5 0 3 .3 4.3.8 1.3.6 2.5 1.3 3.4 2.1 0-.8.3-1.5.8-2.1.5-.5 1.2-.7 2-.7zm-9.7 21.3c2.1 0 3.8-.8 5.1-2.3s2-3.4 2-5.7-.7-4.2-2-5.8c-1.3-1.5-3-2.3-5.1-2.3-2 0-3.7.8-5 2.3-1.3 1.5-2 3.5-2 5.8s.6 4.2 1.9 5.7 3 2.3 5.1 2.3zm32.1-21.3c2.2 0 4.2.6 6 1.7 1.8 1.1 3.2 2.7 4.2 4.7s1.6 4.3 1.6 6.9-.5 4.9-1.5 6.9-2.4 3.6-4.2 4.8c-1.8 1.1-3.7 1.7-5.9 1.7-1.5 0-3-.3-4.3-.9s-2.5-1.4-3.4-2.3v.3c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2.1-.8c-.5-.5-.8-1.2-.8-2.1V18.9c0-.8.3-1.5.8-2.1.5-.6 1.2-.8 2.1-.8s1.5.3 2.1.8c.5.6.8 1.3.8 2.1v10c.8-1 1.8-1.8 3.2-2.5 1.3-.7 2.8-1 4.3-1zm-.7 21.3c2 0 3.7-.8 5-2.3s2-3.5 2-5.8-.6-4.2-1.9-5.7-3-2.3-5.1-2.3-3.8.8-5.1 2.3-2 3.4-2 5.7.7 4.2 2 5.8c1.3 1.6 3 2.3 5.1 2.3zm23.6 1.9c0 .8-.3 1.5-.8 2.1s-1.3.8-2.1.8-1.5-.3-2-.8-.8-1.3-.8-2.1V18.9c0-.8.3-1.5.8-2.1s1.3-.8 2.1-.8 1.5.3 2 .8.8 1.3.8 2.1v29.7zm29.3-10.5c0 .8-.3 1.4-.9 1.9-.6.5-1.2.7-2 .7h-15.8c.4 1.9 1.3 3.4 2.6 4.4 1.4 1.1 2.9 1.6 4.7 1.6 1.3 0 2.3-.1 3.1-.4.7-.2 1.3-.5 1.8-.8.4-.3.7-.5.9-.6.6-.3 1.1-.4 1.6-.4.7 0 1.2.2 1.7.7s.7 1 .7 1.7c0 .9-.4 1.6-1.3 2.4-.9.7-2.1 1.4-3.6 1.9s-3 .8-4.6.8c-2.7 0-5-.6-7-1.7s-3.5-2.7-4.6-4.6-1.6-4.2-1.6-6.6c0-2.8.6-5.2 1.7-7.2s2.7-3.7 4.6-4.8 3.9-1.7 6-1.7 4.1.6 6 1.7 3.4 2.7 4.5 4.7c.9 1.9 1.5 4.1 1.5 6.3zm-12.2-7.5c-3.7 0-5.9 1.7-6.6 5.2h12.6v-.3c-.1-1.3-.8-2.5-2-3.5s-2.5-1.4-4-1.4zm30.3-5.2c1 0 1.8.3 2.4.8.7.5 1 1.2 1 1.9 0 1-.3 1.7-.8 2.2-.5.5-1.1.8-1.8.7-.5 0-1-.1-1.6-.3-.2-.1-.4-.1-.6-.2-.4-.1-.7-.1-1.1-.1-.8 0-1.6.3-2.4.8s-1.4 1.3-1.9 2.3-.7 2.3-.7 3.7v11.4c0 .8-.3 1.5-.8 2.1-.5.6-1.2.8-2.1.8s-1.5-.3-2.1-.8c-.5-.6-.8-1.3-.8-2.1V28.8c0-.8.3-1.5.8-2.1.5-.6 1.2-.8 2.1-.8s1.5.3 2.1.8c.5.6.8 1.3.8 2.1v.6c.7-1.3 1.8-2.3 3.2-3 1.3-.7 2.8-1 4.3-1z" fill-rule="evenodd" clip-rule="evenodd" fill="#4a4a4a"/>
                        </svg>
                    </a>
                </div>
                <div class="d-none d-md-flex">
                    <div class="nav-item">
                        <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                <path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z"></path>
                            </svg>
                        </a>
                        <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7"></path>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <div class="navbar-expand-md">
            <div class="collapse navbar-collapse" id="navbar-menu">
                <div class="navbar navbar-light">
                    <div class="container-xl">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="home.php">
                                    <span class="nav-link-icon d-md-none d-lg-inline-block">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                            <polyline points="9,22 9,12 15,12 15,22"></polyline>
                                        </svg>
                                    </span>
                                    <span class="nav-link-title">Trang chủ</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.php">
                                    <span class="nav-link-icon d-md-none d-lg-inline-block">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                            <polyline points="22,6 12,13 2,6"></polyline>
                                        </svg>
                                    </span>
                                    <span class="nav-link-title">Liên hệ</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-wrapper">
            <div class="page-body">
                <div class="container-xl">
                    <div class="row row-deck row-cards mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <span class="avatar avatar-xl bg-primary-lt">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                        <circle cx="12" cy="7" r="4"></circle>
                                                    </svg>
                                                </span>
                                            </div>
                                            <div>
                                                <h3 class="h2">Chào mừng trở lại, Admin!</h3>
                                                <p class="text-muted">Bạn có <?php echo $totalUsers; ?> người dùng và <?php echo $totalOrders; ?> đơn hàng.</p>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <span class="bg-blue text-white avatar">
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/package -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="col">
                                            <div class="font-weight-medium">Tổng sản phẩm</div>
                                            <div class="text-secondary"><?php echo $totalProducts; ?> sản phẩm</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <span class="bg-green text-white avatar">
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/shopping-cart -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                                    <circle cx="9" cy="21" r="1"></circle>
                                                    <circle cx="20" cy="21" r="1"></circle>
                                                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 1.94-1.49l1.34-8.34A2 2 0 0 0 19.72 3H5.82"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="col">
                                            <div class="font-weight-medium">Tổng đơn hàng</div>
                                            <div class="text-secondary"><?php echo $totalOrders; ?> đơn hàng</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <span class="bg-yellow text-white avatar">
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/users -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="9" cy="7" r="4"></circle>
                                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="col">
                                            <div class="font-weight-medium">Tổng người dùng</div>
                                            <div class="text-secondary"><?php echo $totalUsers; ?> người dùng</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <span class="bg-red text-white avatar">
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/mail -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-1">
                                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                                    <polyline points="22,6 12,13 2,6"></polyline>
                                                </svg>
                                            </span>
                                        </div>
                                        <div class="col">
                                            <div class="font-weight-medium">Liên hệ chưa đọc</div>
                                            <div class="text-secondary">2 liên hệ</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    

                    <div class="row row-deck row-cards mb-4">
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="subheader">Doanh Thu</div>
                                        <div class="ms-auto lh-1">
                                            <div class="dropdown">
                                                <a
                                                    class="dropdown-toggle text-secondary"
                                                    id="revenue-dropdown"
                                                    href="#"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    aria-label="Select time range for revenue"
                                                    >Last 7 days</a
                                                >
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="revenue-dropdown">
                                                    <a class="dropdown-item active" href="#" aria-current="true">Last 7 days</a>
                                                    <a class="dropdown-item" href="#">Last 30 days</a>
                                                    <a class="dropdown-item" href="#">Last 3 months</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-baseline">
                                        <div class="h1 mb-0 me-2"><?php echo number_format($totalRevenue, 0, ',', '.'); ?> VND</div>
                                        <div class="me-auto">
                                            <span class="text-green d-inline-flex align-items-center lh-1">
                                                8%
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/trending-up -->
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="icon ms-1 icon-2"
                                                >
                                                    <path d="M3 17l6 -6l4 4l8 -8" />
                                                    <path d="M14 7l7 0l0 7" />
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div id="chart-revenue-card" class="position-relative rounded-bottom chart-sm d-flex justify-content-center"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="subheader">Số Người Dùng</div>
                                        <div class="ms-auto lh-1">
                                            <div class="dropdown">
                                                <a
                                                    class="dropdown-toggle text-secondary"
                                                    id="new-clients-dropdown"
                                                    href="#"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    aria-label="Select time range for new clients"
                                                    >Last 7 days</a
                                                >
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="new-clients-dropdown">
                                                    <a class="dropdown-item active" href="#" aria-current="true">Last 7 days</a>
                                                    <a class="dropdown-item" href="#">Last 30 days</a>
                                                    <a class="dropdown-item" href="#">Last 3 months</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-baseline">
                                        <div class="h1 mb-3 me-2"><?php echo $totalUsers; ?></div>
                                        <div class="me-auto">
                                            <span class="text-yellow d-inline-flex align-items-center lh-1">
                                                0%
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/minus -->
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="icon ms-1 icon-2"
                                                >
                                                    <path d="M5 12l14 0" />
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="chart-new-clients" class="position-relative chart-sm d-flex justify-content-center"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="subheader">Đơn hàng</div>
                                        <div class="ms-auto lh-1">
                                            <div class="dropdown">
                                                <a
                                                    class="dropdown-toggle text-secondary"
                                                    id="active-users-dropdown"
                                                    href="#"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    aria-label="Select time range for active users"
                                                    >Last 7 days</a
                                                >
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="active-users-dropdown">
                                                    <a class="dropdown-item active" href="#" aria-current="true">Last 7 days</a>
                                                    <a class="dropdown-item" href="#">Last 30 days</a>
                                                    <a class="dropdown-item" href="#">Last 3 months</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-baseline">
                                        <div class="h1 mb-3 me-2"><?php echo $totalOrders; ?></div>
                                        <div class="me-auto">
                                            <span class="text-green d-inline-flex align-items-center lh-1">
                                                4%
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/trending-up -->
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="icon ms-1 icon-2"
                                                >
                                                    <path d="M3 17l6 -6l4 4l8 -8" />
                                                    <path d="M14 7l7 0l0 7" />
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="chart-active-users" class="position-relative chart-sm d-flex justify-content-center"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="subheader">Liên Hệ</div>
                                        <div class="ms-auto lh-1">
                                            <div class="dropdown">
                                                <a
                                                    class="dropdown-toggle text-secondary"
                                                    id="contacts-dropdown"
                                                    href="#"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    aria-label="Select time range for contacts"
                                                    >Last 7 days</a
                                                >
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="contacts-dropdown">
                                                    <a class="dropdown-item active" href="#" aria-current="true">Last 7 days</a>
                                                    <a class="dropdown-item" href="#">Last 30 days</a>
                                                    <a class="dropdown-item" href="#">Last 3 months</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-baseline">
                                        <div class="h1 mb-3 me-2">2</div>
                                        <div class="me-auto">
                                            <span class="text-green d-inline-flex align-items-center lh-1">
                                                7%
                                                <!-- Download SVG icon from http://tabler.io/icons/icon/trending-up -->
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    class="icon ms-1 icon-2"
                                                >
                                                    <path d="M3 17l6 -6l4 4l8 -8" />
                                                    <path d="M14 7l7 0l0 7" />
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="chart-contacts" class="position-relative chart-sm d-flex justify-content-center"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-deck row-cards mb-4">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h3 class="card-title">Mức Độ Tăng Trưởng Người Dùng</h3>
                                    <div id="chart-mentions" class="position-relative chart-lg"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row row-cards">
                                <div class="col-12">
                                    <div class="card" style="height: 28rem">
                                        <div class="card-body card-body-scrollable card-body-scrollable-shadow">
                                            <div class="divide-y">
                                                <?php foreach ($reviews as $review): ?>
                                                <div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="text-truncate"><strong><?php echo htmlspecialchars($review['name']); ?></strong> đã để lại một bình luận: <strong><?php echo htmlspecialchars(substr($review['message'], 0, 50)); ?>...</strong></div>
                                                            <div class="text-secondary"><?php echo date('d M Y', strtotime($review['created_at'])); ?></div>
                                                        </div>
                                                        <div class="col-auto align-self-center">
                                                            <div class="badge bg-primary"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-deck row-cards mb-4">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Đơn Hàng Vừa Đặt</h3>
                                </div>
                                <div class="card-body border-bottom py-3">
                                    <div class="d-flex">
                                        <div class="text-secondary">
                                            Show
                                            <div class="mx-2 d-inline-block">
                                                <input type="text" class="form-control form-control-sm" value="10" size="3" aria-label="Orders count" />
                                            </div>
                                            entries
                                        </div>
                                        <div class="ms-auto text-secondary">
                                            Search:
                                            <div class="ms-2 d-inline-block">
                                                <input type="text" class="form-control form-control-sm" aria-label="Search order" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="table-default" class="table table-selectable card-table table-vcenter text-nowrap datatable">
                                        <thead>
                                            <tr>
                                                <th class="w-1"><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all orders" /></th>
                                                <th class="w-1">
                                                    Order No.
                                                    <!-- Download SVG icon from http://tabler.io/icons/icon/chevron-up -->
                                                    <svg
                                                      xmlns="http://www.w3.org/2000/svg"
                                                      width="24"
                                                      height="24"
                                                      viewBox="0 0 24 24"
                                                      fill="none"
                                                      stroke="currentColor"
                                                      stroke-width="2"
                                                      stroke-linecap="round"
                                                      stroke-linejoin="round"
                                                      class="icon icon-sm icon-thick icon-2"
                                                    >
                                                      <path d="M6 15l6 -6l6 6" />
                                                    </svg>
                                                </th>
                                                <th>Customer</th>
                                                <th>Items</th>
                                                <th>Created</th>
                                                <th>Status</th>
                                                <th>Total</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-tbody">
                                            <?php foreach ($recentOrders as $order): ?>
                                            <tr>
                                                <td><input class="form-check-input m-0 align-middle table-selectable-check" type="checkbox" aria-label="Select order" /></td>
                                                <td><span class="text-secondary sort-id"><?php echo htmlspecialchars($order['order_number']); ?></span></td>
                                                <td class="sort-name"><?php echo htmlspecialchars($order['full_name']); ?></td>
                                                <td>TechStore Order</td>
                                                <td class="sort-date"><?php echo date('d M Y', strtotime($order['created_at'])); ?></td>
                                                <td class="sort-status">
                                                    <span class="badge bg-<?php echo $order['status'] == 'completed' ? 'success' : ($order['status'] == 'pending' ? 'warning' : 'secondary'); ?> me-1"></span>
                                                    <?php echo ucfirst($order['status']); ?>
                                                </td>
                                                <td><?php echo number_format($order['total_amount'], 0, ',', '.'); ?> VND</td>
                                                <td class="text-end">
                                                    <span class="dropdown">
                                                        <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
                                                        <div class="dropdown-menu dropdown-menu-end">
                                                            <a class="dropdown-item" href="#">View Details</a>
                                                            <a class="dropdown-item" href="#">Update Status</a>
                                                        </div>
                                                    </span>
                                                </td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    <div class="row g-2 justify-content-center justify-content-sm-between">
                                        <div class="col-auto d-flex align-items-center">
                                            <p class="m-0 text-secondary">Showing <strong>1 to <?php echo count($recentOrders); ?></strong> of <strong><?php echo $totalOrders; ?> entries</strong></p>
                                        </div>
                                        <div class="col-auto">
                                            <ul class="pagination m-0 ms-auto">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                                        <!-- Download SVG icon from http://tabler.io/icons/icon/chevron-left -->
                                                        <svg
                                                          xmlns="http://www.w3.org/2000/svg"
                                                          width="24"
                                                          height="24"
                                                          viewBox="0 0 24 24"
                                                          fill="none"
                                                          stroke="currentColor"
                                                          stroke-width="2"
                                                          stroke-linecap="round"
                                                          stroke-linejoin="round"
                                                          class="icon icon-1"
                                                        >
                                                          <path d="M15 6l-6 6l6 6" />
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li class="page-item active">
                                                    <a class="page-link" href="#">1</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">
                                                        <!-- Download SVG icon from http://tabler.io/icons/icon/chevron-right -->
                                                        <svg
                                                          xmlns="http://www.w3.org/2000/svg"
                                                          width="24"
                                                          height="24"
                                                          viewBox="0 0 24 24"
                                                          fill="none"
                                                          stroke="currentColor"
                                                          stroke-width="2"
                                                          stroke-linecap="round"
                                                          stroke-linejoin="round"
                                                          class="icon icon-1"
                                                        >
                                                          <path d="M9 6l6 6l-6 6" />
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="../dist/js/tabler.min.js?1760059270"></script>
    <script src="../dist/libs/list.js/dist/list.min.js?1760059269" defer></script>
    <script src="../dist/libs/apexcharts/dist/apexcharts.min.js?1760059270"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // User Growth chart
            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-mentions"), {
                    chart: {
                        type: "line",
                        fontFamily: "inherit",
                        height: 288,
                        parentHeightOffset: 0,
                        toolbar: {
                            show: false,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    stroke: {
                        width: 2,
                        lineCap: "round",
                        curve: "smooth",
                    },
                    series: [
                        {
                            name: "Total Users",
                            data: <?php echo json_encode($data); ?>,
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        strokeDashArray: 4,
                    },
                    xaxis: {
                        labels: {
                            padding: 0,
                        },
                        tooltip: {
                            enabled: false,
                        },
                        axisBorder: {
                            show: false,
                        },
                        type: "datetime",
                    },
                    yaxis: {
                        labels: {
                            padding: 4,
                        },
                    },
                    labels: <?php echo json_encode($dates); ?>,
                    colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
                    legend: {
                        show: false,
                    },
                }).render();

            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-revenue-bg"), {
                    chart: {
                        type: "line",
                        fontFamily: "inherit",
                        height: 288,
                        parentHeightOffset: 0,
                        toolbar: {
                            show: false,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    stroke: {
                        width: 2,
                        lineCap: "round",
                        curve: "smooth",
                    },
                    series: [
                        {
                            name: "Total Users",
                            data: <?php echo json_encode($data); ?>,
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        padding: {
                            top: -20,
                            right: 0,
                            left: -4,
                            bottom: -4,
                        },
                        strokeDashArray: 4,
                    },
                    xaxis: {
                        labels: {
                            padding: 0,
                        },
                        tooltip: {
                            enabled: false,
                        },
                        type: "datetime",
                    },
                    yaxis: {
                        labels: {
                            padding: 4,
                        },
                    },
                    labels: <?php echo json_encode($dates); ?>,
                    colors: [
                        "color-mix(in srgb, transparent, var(--tblr-primary) 100%)",
                    ],
                    legend: {
                        show: false,
                    },
                }).render();

            // New clients chart (Total Users)
            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-new-clients"), {
                    chart: {
                        type: "line",
                        fontFamily: "inherit",
                        height: 40,
                        sparkline: {
                            enabled: true,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    stroke: {
                        width: 2,
                        lineCap: "round",
                        curve: "smooth",
                    },
                    series: [
                        {
                            name: "Users",
                            data: <?php echo json_encode($userChartValues); ?>,
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        strokeDashArray: 4,
                    },
                    xaxis: {
                        labels: {
                            padding: 0,
                        },
                        tooltip: {
                            enabled: false,
                        },
                        type: "datetime",
                    },
                    yaxis: {
                        labels: {
                            padding: 4,
                        },
                    },
                    labels: <?php echo json_encode($chartDates); ?>,
                    colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
                    legend: {
                        show: false,
                    },
                }).render();

            // Active subscriptions chart (Total Orders)
            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-active-users"), {
                    chart: {
                        type: "bar",
                        fontFamily: "inherit",
                        height: 40,
                        sparkline: {
                            enabled: true,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    plotOptions: {
                        bar: {
                            columnWidth: "50%",
                        },
                    },
                    dataLabels: {
                        enabled: false,
                    },
                    series: [
                        {
                            name: "Orders",
                            data: <?php echo json_encode($orderChartValues); ?>,
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        strokeDashArray: 4,
                    },
                    xaxis: {
                        labels: {
                            padding: 0,
                        },
                        tooltip: {
                            enabled: false,
                        },
                        type: "datetime",
                    },
                    yaxis: {
                        labels: {
                            padding: 4,
                        },
                    },
                    labels: <?php echo json_encode($chartDates); ?>,
                    colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
                    legend: {
                        show: false,
                    },
                }).render();

            // Contacts chart (using revenue chart configuration)
            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-contacts"), {
                    chart: {
                        type: "area",
                        fontFamily: "inherit",
                        height: 40,
                        sparkline: {
                            enabled: true,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    dataLabels: {
                        enabled: false,
                    },
                    fill: {
                        colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 16%)", "color-mix(in srgb, transparent, var(--tblr-primary) 16%)"],
                        type: "solid",
                    },
                    stroke: {
                        width: 2,
                        lineCap: "round",
                        curve: "smooth",
                    },
                    series: [
                        {
                            name: "Contacts",
                            data: <?php echo json_encode($contactChartValues); ?>,
                        },
                    ],
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        strokeDashArray: 4,
                    },
                    xaxis: {
                        labels: {
                            padding: 0,
                        },
                        tooltip: {
                            enabled: false,
                        },
                        axisBorder: {
                            show: false,
                        },
                        type: "datetime",
                    },
                    yaxis: {
                        labels: {
                            padding: 4,
                        },
                    },
                    labels: <?php echo json_encode($chartDates); ?>,
                    colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
                    legend: {
                        show: false,
                    },
                }).render();

            // Initialize datatable
            const options = {
                valueNames: ['sort-id', 'sort-name', 'sort-email', 'sort-phone', 'sort-message', 'sort-status', 'sort-date'],
                page: 10,
                pagination: [{
                    paginationClass: "pagination",
                    item: "<li class='page-item'><a class='page-link' href='#'></a></li>",
                    innerWindow: 2,
                    left: 1,
                    right: 1
                }]
            };

            const ordersTable = new List('table-default', options);

            // Update pagination info
            ordersTable.on('updated', function() {
                const showing = ordersTable.visibleItems.length;
                const total = ordersTable.items.length;
                const start = (ordersTable.page - 1) * ordersTable.page + 1;
                const end = Math.min(start + showing - 1, total);

                // Update footer text
                const footerText = document.querySelector('.card-footer p');
                if (footerText) {
                    footerText.innerHTML = `Showing <strong>${start} to ${end}</strong> of <strong>${total} entries</strong>`;
                }
            });

            // Handle show entries change
            document.querySelector('input[aria-label="Orders count"]').addEventListener('change', function() {
                const newPageSize = parseInt(this.value) || 10;
                ordersTable.page = newPageSize;
                ordersTable.update();
            });

            // Handle search
            document.querySelector('input[aria-label="Search order"]').addEventListener('input', function() {
                ordersTable.search(this.value);
            });

        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            window.ApexCharts &&
                new ApexCharts(document.getElementById("chart-users"), {
                    chart: {
                        type: "donut",
                        fontFamily: "inherit",
                        height: 240,
                        sparkline: {
                            enabled: true,
                        },
                        animations: {
                            enabled: false,
                        },
                    },
                    series: <?php echo json_encode($sourceData); ?>,
                    labels: <?php echo json_encode($sourceLabels); ?>,
                    tooltip: {
                        theme: "dark",
                    },
                    grid: {
                        strokeDashArray: 4,
                    },
                    colors: [
                        "color-mix(in srgb, transparent, var(--tblr-primary) 100%)",
                        "color-mix(in srgb, transparent, var(--tblr-primary) 80%)",
                        "color-mix(in srgb, transparent, var(--tblr-primary) 60%)",
                        "color-mix(in srgb, transparent, var(--tblr-gray-300) 100%)",
                    ],
                    legend: {
                        show: true,
                        position: "bottom",
                        offsetY: 12,
                        markers: {
                            width: 10,
                            height: 10,
                            radius: 100,
                        },
                        itemMargin: {
                            horizontal: 8,
                            vertical: 8,
                        },
                    },
                    tooltip: {
                        fillSeriesColor: false,
                    },
                }).render();
        });

        // Revenue chart
        window.ApexCharts &&
            new ApexCharts(document.getElementById("chart-revenue-card"), {
                chart: {
                    type: "area",
                    fontFamily: "inherit",
                    height: 40,
                    sparkline: {
                        enabled: true,
                    },
                    animations: {
                        enabled: false,
                    },
                },
                dataLabels: {
                    enabled: false,
                },
                fill: {
                    opacity: 0.16,
                    type: "solid",
                },
                stroke: {
                    width: 2,
                    lineCap: "round",
                    curve: "smooth",
                },
                series: [
                    {
                        name: "Revenue",
                        data: [4164, 4652, 4817, 4841, 4920, 5439, 5486, 5498, 5512, 5538, 5841, 5877, 6086, 6146, 6199, 6431, 6704, 7939, 8127, 8296, 8322, 8389, 8411, 8502, 8868, 8977, 9273, 9325, 9345, 9430],
                    },
                ],
                tooltip: {
                    theme: "dark",
                },
                grid: {
                    strokeDashArray: 4,
                },
                xaxis: {
                    labels: {
                        padding: 0,
                    },
                    tooltip: {
                        enabled: false,
                    },
                    axisBorder: {
                        show: false,
                    },
                    type: "datetime",
                },
                yaxis: {
                    labels: {
                        padding: 4,
                    },
                },
                labels: [
                    "2020-06-20",
                    "2020-06-21",
                    "2020-06-22",
                    "2020-06-23",
                    "2020-06-24",
                    "2020-06-25",
                    "2020-06-26",
                    "2020-06-27",
                    "2020-06-28",
                    "2020-06-29",
                    "2020-06-30",
                    "2020-07-01",
                    "2020-07-02",
                    "2020-07-03",
                    "2020-07-04",
                    "2020-07-05",
                    "2020-07-06",
                    "2020-07-07",
                    "2020-07-08",
                    "2020-07-09",
                    "2020-07-10",
                    "2020-07-11",
                    "2020-07-12",
                    "2020-07-13",
                    "2020-07-14",
                    "2020-07-15",
                    "2020-07-16",
                    "2020-07-17",
                    "2020-07-18",
                    "2020-07-19",
                ],
                colors: ["color-mix(in srgb, transparent, var(--tblr-primary) 100%)"],
                legend: {
                    show: false,
                },
            }).render();
    </script>
</body>
</html>