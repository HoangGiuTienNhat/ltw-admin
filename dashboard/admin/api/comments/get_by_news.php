<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_GET['news_id'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu ID"]);
    exit();
}
$news_id = $_GET['news_id'];
$news_id = filter_var($news_id, FILTER_VALIDATE_INT);

if ($news_id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}

$page = isset($_GET['page']) ? $_GET['page'] : 1;
$limit = 6;
$offset = ($page - 1) * $limit;
if ($news_id > 0) {
    $sql = "SELECT * FROM news_comments WHERE news_id = ? ORDER BY created_at DESC LIMIT ? OFFSET ?";
    $sqlCount = "SELECT COUNT(id) as total 
                 FROM news_comments
                 WHERE news_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iii", $news_id, $limit, $offset);
    $stmt->execute();
    $result = $stmt->get_result();
    $comments = $result->fetch_all(MYSQLI_ASSOC);
    $stmt->close();

    // Tính tổng số bản ghi để phân trang
    $stmtTotal = $conn->prepare($sqlCount);
    $stmtTotal->bind_param("i", $news_id);
    $stmtTotal->execute();
    $resultTotal = $stmtTotal->get_result();
    $total_rows = $resultTotal->fetch_assoc()['total'];
    $total_pages = ceil($total_rows / $limit);
    $stmtTotal->close();

    echo json_encode([
        "status"     => "success", 
        "data"       => $comments,
        "pagination" => [
            "current_page" => $page,
            "total_pages"  => $total_pages
        ]
    ]);

} else {
    echo json_encode(["status" => "error", "data" => []]);
}

$conn->close();
?>