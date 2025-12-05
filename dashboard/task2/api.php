<?php
// 1. CẤU HÌNH KẾT NỐI DATABASE
$host = 'localhost';
$db   = 'techstore_db';
$user = 'root';      
$pass = '123123';          
$charset = 'utf8mb4';

// Cấu hình Header để tránh lỗi CORS khi gọi API
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (\PDOException $e) {
    echo json_encode(['error' => 'Lỗi kết nối Database: ' . $e->getMessage()]);
    exit;
}

$action = $_GET['action'] ?? '';
$inputJSON = file_get_contents('php://input');
$inputBody = json_decode($inputJSON, true);

// ================= MODULE 1: DASHBOARD STATS (THỐNG KÊ) =================
if ($action == 'get_dashboard_stats') {
    header('Content-Type: application/json');
    $response = [];

    try {
        // 1. Tổng doanh thu (đơn completed)
        $stmt = $pdo->query("SELECT SUM(total_amount) as total FROM orders WHERE status = 'completed'");
        $response['revenue'] = $stmt->fetch()['total'] ?? 0;

        // 2. Số đơn hàng mới (hôm nay)
        $stmt = $pdo->query("SELECT COUNT(*) as count FROM orders WHERE DATE(created_at) = CURDATE()");
        $response['new_orders'] = $stmt->fetch()['count'] ?? 0;

        // 3. Khách hàng mới (tổng số khách khác nhau)
        $stmt = $pdo->query("SELECT COUNT(DISTINCT user_id) as count FROM orders"); // Sửa lại user_id cho khớp DB
        $response['new_clients'] = $stmt->fetch()['count'] ?? 0;

        // 4. Đơn hàng gần đây (5 đơn)
        $stmt = $pdo->query("SELECT * FROM orders ORDER BY created_at DESC LIMIT 5");
        $response['recent_orders'] = $stmt->fetchAll();

        // 5. Dữ liệu biểu đồ (7 ngày qua)
        $stmt = $pdo->query("
            SELECT DATE(created_at) as date, SUM(total_amount) as total 
            FROM orders 
            WHERE status = 'completed' AND created_at >= DATE(NOW()) - INTERVAL 7 DAY
            GROUP BY DATE(created_at)
            ORDER BY date ASC
        ");
        $response['chart_data'] = $stmt->fetchAll();

        echo json_encode($response);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
    exit;
}

// ================= MODULE 2: UPLOAD FILE (ẢNH) =================
if ($action == 'upload') {
    header('Content-Type: application/json');
    if (empty($_FILES['file'])) { echo json_encode(['error' => 'Chưa chọn file']); exit; }
    
    $uploadDir = 'uploads/';
    if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);
    
    $uploadedUrls = [];
    $files = $_FILES['file'];
    
    // Xử lý upload (hỗ trợ cả đơn lẻ và nhiều file)
    $fileNames = is_array($files['name']) ? $files['name'] : [$files['name']];
    $fileTmps = is_array($files['tmp_name']) ? $files['tmp_name'] : [$files['tmp_name']];
    $fileErrors = is_array($files['error']) ? $files['error'] : [$files['error']];

    for ($i = 0; $i < count($fileNames); $i++) {
        if ($fileErrors[$i] === UPLOAD_ERR_OK) {
            $fileName = time() . '_' . uniqid() . '_' . basename($fileNames[$i]);
            $targetPath = $uploadDir . $fileName;
            if (move_uploaded_file($fileTmps[$i], $targetPath)) {
                $uploadedUrls[] = $targetPath; // Trả về đường dẫn để lưu vào DB
            }
        }
    }
    
    if (!empty($uploadedUrls)) echo json_encode(['success' => true, 'urls' => $uploadedUrls]);
    else echo json_encode(['error' => 'Upload thất bại']);
    exit;
}

// ================= MODULE 3: SETTINGS (CẤU HÌNH & BẢN ĐỒ) =================
if ($action == 'get_settings') {
    header('Content-Type: application/json');
    $stmt = $pdo->query("SELECT * FROM settings");
    $settings = [];
    while ($row = $stmt->fetch()) {
        // Tự động decode nếu dữ liệu là JSON (như footer_col, banners)
        $decoded = json_decode($row['setting_value'], true);
        $settings[$row['setting_key']] = (json_last_error() === JSON_ERROR_NONE) ? $decoded : $row['setting_value'];
    }
    echo json_encode($settings);
    exit;
}

if ($action == 'save_settings') {
    header('Content-Type: application/json');
    // Lấy dữ liệu từ POST (nếu dùng Form) hoặc JSON Body (nếu dùng Fetch API JSON)
    $data = $_POST ?: $inputBody;

    if (!empty($data)) {
        try {
            $pdo->beginTransaction();
            
            // Câu lệnh SQL "Thần thánh": Nếu key chưa có thì Thêm mới (INSERT), nếu có rồi thì Cập nhật (UPDATE)
            // Điều này giúp tự động lưu 'google_map' mà không cần sửa code SQL
            $stmt = $pdo->prepare("INSERT INTO settings (setting_key, setting_value) VALUES (?, ?) ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value)");
            
            foreach ($data as $key => $value) {
                // Nếu giá trị là mảng (như banner, menu footer) thì chuyển thành chuỗi JSON
                // Nếu là chuỗi thường (như google_map, address) thì giữ nguyên
                $val = (is_array($value) || is_object($value)) ? json_encode($value, JSON_UNESCAPED_UNICODE) : $value;
                
                $stmt->execute([$key, $val]);
            }
            
            $pdo->commit();
            echo json_encode(['success' => true]);
        } catch (Exception $e) {
            $pdo->rollBack();
            echo json_encode(['error' => $e->getMessage()]);
        }
    } else {
        echo json_encode(['error' => 'Không có dữ liệu gửi lên']);
    }
    exit;
}

// ================= MODULE 4: FAQ (HỎI ĐÁP) =================
if ($action == 'get_faqs') {
    header('Content-Type: application/json');
    $stmt = $pdo->query("SELECT * FROM faq ORDER BY id ASC"); // Sửa lại ORDER BY ID tăng dần
    echo json_encode($stmt->fetchAll());
    exit;
}

if ($action == 'save_faq') {
    header('Content-Type: application/json');
    $id = $inputBody['id'] ?? '';
    if ($id) {
        $stmt = $pdo->prepare("UPDATE faq SET question=?, answer=?, status=? WHERE id=?");
        $stmt->execute([$inputBody['question'], $inputBody['answer'], $inputBody['status'], $id]);
    } else {
        $stmt = $pdo->prepare("INSERT INTO faq (question, answer, status) VALUES (?, ?, ?)");
        $stmt->execute([$inputBody['question'], $inputBody['answer'], $inputBody['status']]);
    }
    echo json_encode(['success' => true]);
    exit;
}

if ($action == 'delete_faq') {
    header('Content-Type: application/json');
    $stmt = $pdo->prepare("DELETE FROM faq WHERE id=?");
    $stmt->execute([$inputBody['id']]);
    echo json_encode(['success' => true]);
    exit;
}

echo json_encode(['message' => 'API Ready']);
?>