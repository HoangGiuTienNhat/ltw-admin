<?php
require_once '../../config.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "chỉ cho phép phương thức POST"]);
    exit();
}

if (!isset($_POST['id'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu ID"]);
    exit();
}

// Validate ID
$id = filter_var($_POST['id'], FILTER_VALIDATE_INT);

if ($id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}

$sql = "DELETE FROM news_comments WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo json_encode(["status" => "success", "message" => "Xóa bình luận thành công"]);
    } else {
        echo json_encode(["status" => "error", "message" => "ID không tìm thấy"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Lỗi database"]);
}
$stmt->close();
$conn->close();
?>