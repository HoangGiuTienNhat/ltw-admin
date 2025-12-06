<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');
$path_uploads = "../../../../../project-web/public/news_uploads/";


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "chỉ cho phép phương thức POST"]);
    exit();
}

if (!isset($_POST['id'])) {
    echo json_encode(["status" => "error", "message" => "Thiếu ID"]);
    exit();
}

$id = filter_var($_POST['id'], FILTER_VALIDATE_INT);

if ($id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}


$sqlGet = "SELECT image FROM news WHERE id = ?";
$stmtGet = $conn->prepare($sqlGet);
$stmtGet->bind_param("i", $id);
$stmtGet->execute();
$resultGet = $stmtGet->get_result();
$news = $resultGet->fetch_assoc();

if ($news) {
    $sqlDel = "DELETE FROM news WHERE id = ?";
    $stmtDel = $conn->prepare($sqlDel);
    $stmtDel->bind_param("i", $id);
    
    if ($stmtDel->execute()) {
        if ($news['image']) {
            $filePath = $path_uploads . $news['image'];
            if (file_exists($filePath)) unlink($filePath);
        }
        echo json_encode(["status" => "success", "message" => "Xóa thành công"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Lỗi database"]);
    }
    $stmtDel->close();
} else {
    echo json_encode(["status" => "error", "message" => "Bài viết không tồn tại"]);
}

$stmtGet->close();
$conn->close();
?>