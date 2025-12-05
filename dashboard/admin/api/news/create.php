<?php
include_once '../config/database.php';
header('Content-Type: application/json; charset=utf-8');
$path_uploads = "../../../../../project-web/public/news_uploads/";


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "chỉ cho phép phương thức POST"]);
    exit();
}

$title = trim($_POST['title'] ?? '');
$content = trim($_POST['content'] ?? '');
$imageName = '';

if (empty($title) || empty($content)) {
    echo json_encode(["status" => "error", "message" => "Thiếu tiêu đề hoặc nội dung"]);
    exit();
}
$title = stripslashes($title);
$content = stripslashes($content);
$title = htmlspecialchars($title, ENT_QUOTES, 'UTF-8');
$content = htmlspecialchars($content, ENT_QUOTES, 'UTF-8');

if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
    $target_dir = $path_uploads;
    if (!file_exists($target_dir)) mkdir($target_dir, 0777, true);
    
    $ext = pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION);
    $fileName = time() . "_" . uniqid() . "." . $ext;
    
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_dir . $fileName)) {
        $imageName = $fileName;
    }
}

$sql = "INSERT INTO news (title, content, image) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);

$stmt->bind_param("sss", $title, $content, $imageName);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Thêm thành công"]);
} else {
    echo json_encode(["status" => "error", "message" => "Lỗi database: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>