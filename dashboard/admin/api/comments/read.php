<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');

$page = filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT);
if ($page === false || $page < 1) {
    $page = 1;
}
$limit = 6;
$offset = ($page - 1) * $limit;
$search = trim($_GET['search'] ?? '');
$statusFilter = filter_input(INPUT_GET, 'status', FILTER_VALIDATE_INT);
if ($statusFilter === false) {
    $statusFilter = -1;
}

// JOIN bảng comments với news để lấy title
$sql = "SELECT c.*, n.id as news_id, n.title as news_title 
        FROM news_comments c 
        LEFT JOIN news n ON c.news_id = n.id
        WHERE 1=1";
$sqlCount = "SELECT COUNT(c.id) as total 
             FROM news_comments c
             LEFT JOIN news n ON c.news_id = n.id
             WHERE 1=1";
$sqlParams = [];
$sqlCountParams = [];
$sqlTypes = "";
$sqlCountTypes = "";

if ($statusFilter !== -1) {
    $sql .= " AND c.status = ?";
    $sqlCount .= " AND status = ?";
    
    $sqlParams[] = $statusFilter;
    $sqlTypes .= "i";

    $sqlCountParams[] = $statusFilter;
    $sqlCountTypes .= "i";
}

if ($search !== '') {
    $sql .= " AND (c.author LIKE ? OR c.content LIKE ? OR n.title LIKE ?)";
    $sqlCount .= " AND (c.author LIKE ? OR c.content LIKE ? OR n.title LIKE ?)";
    $search = stripslashes($search);
    $search = htmlspecialchars($search, ENT_QUOTES, 'UTF-8');
    $searchTerm = "%" . $search . "%";
    $sqlParams[] = $searchTerm;
    $sqlParams[] = $searchTerm;
    $sqlParams[] = $searchTerm;
    $sqlTypes .= "sss";

    $sqlCountParams[] = $searchTerm;
    $sqlCountParams[] = $searchTerm;
    $sqlCountParams[] = $searchTerm;
    $sqlCountTypes .= "sss";
}

$sql .= " ORDER BY c.created_at DESC LIMIT ? OFFSET ?";
$sqlParams[] = $limit;
$sqlParams[] = $offset;
$sqlTypes .= "ii";

$stmt = $conn->prepare($sql);
$stmt->bind_param($sqlTypes, ...$sqlParams);
$stmt->execute();
$result = $stmt->get_result();
$comments = $result->fetch_all(MYSQLI_ASSOC);
$stmt->close();

// Tính tổng số bản ghi để phân trang
$stmtTotal = $conn->prepare($sqlCount);
if ($search !== "" || $statusFilter !== -1) {
    $stmtTotal->bind_param($sqlCountTypes, ...$sqlCountParams);
}
$stmtTotal->execute();
$resultTotal = $stmtTotal->get_result();
$rowTotal = $resultTotal->fetch_assoc();
$total_rows = $rowTotal['total'];
$total_pages = ceil($total_rows / $limit);
$stmtTotal->close();

echo json_encode([
    "data"       => $comments,
    "pagination" => [
        "current_page" => $page,
        "total_pages"  => $total_pages
    ]
]); 

$conn->close();
?>