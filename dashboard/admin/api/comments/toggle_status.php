<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "chỉ cho phép phương thức POST"]);
    exit();
}

if (!isset($_POST['id'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu ID"]);
    exit();
}

$id = filter_var($_POST['id'], FILTER_VALIDATE_INT);
$status = filter_var($_POST['status'], FILTER_VALIDATE_INT);

if ($id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}

if ($status === false) {
    echo json_encode(["status" => "error", "message" => "Trạng thái không hợp lệ"]);
    exit();
}


$sql = "UPDATE news_comments SET status = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $status, $id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo json_encode(["status" => "success", "message" => "Cập nhật trạng thái thành công"]);
    } else {
        echo json_encode(["status" => "error", "message" => "ID không tìm thấy"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Lỗi database"]);
}
$stmt->close();
$conn->close();
?>