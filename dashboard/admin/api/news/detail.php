<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_GET['id'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu ID"]);
    exit();
}
$id = $_GET['id'];
$id = filter_var($id, FILTER_VALIDATE_INT);

if ($id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}

if ($id > 0) {
    $sql = "SELECT * FROM news WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $news = $result->fetch_assoc();

    if ($news) {
        echo json_encode(["status" => "success", "data" => $news]);
    } else {
        echo json_encode(["status" => "error", "message" => "Không tìm thấy bài viết"]);
    }
    
    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
}

$conn->close();
?>