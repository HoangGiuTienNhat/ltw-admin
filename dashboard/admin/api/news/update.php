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
if ($id === false) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit();
}
$title = trim($_POST['title'] ?? '');
$content = trim($_POST['content'] ?? '');

if (empty($title) || empty($content)) {
    echo json_encode(["status" => "error", "message" => "Thiếu tiêu đề hoặc nội dung"]);
    exit();
}
$title = stripslashes($title);
// $content = stripslashes($content);
$title = htmlspecialchars($title, ENT_QUOTES, 'UTF-8');
// $content = htmlspecialchars($content, ENT_QUOTES, 'UTF-8');

$sqlGet = "SELECT image FROM news WHERE id = ?";
$stmtGet = $conn->prepare($sqlGet);
$stmtGet->bind_param("i", $id);
$stmtGet->execute();
$resultGet = $stmtGet->get_result();
$oldNews = $resultGet->fetch_assoc();

if (!$oldNews) {
    echo json_encode(["status" => "error", "message" => "Bài viết không tồn tại"]);
    exit();
}

$imageName = $oldNews['image'];
$path_uploads = "../../../../../project-web/public/news_uploads/";
// Xử lý Upload ảnh mới (nếu có)
if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
    $target_dir = $path_uploads;
    $ext = pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION);
    $newFileName = time() . "_" . uniqid() . "." . $ext;
    
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_dir . $newFileName)) {
        $imageName = $newFileName;
        
        // Xóa ảnh cũ
        if ($oldNews['image'] && file_exists($target_dir . $oldNews['image'])) {
            unlink($target_dir . $oldNews['image']);
        }
    }
}

$sql = "UPDATE news SET title = ?, content = ?, image = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $title, $content, $imageName, $id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo json_encode(["status" => "success", "message" => "Cập nhật thành công"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Không có thay đổi được thực hiện"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Lỗi cập nhật: " . $stmt->error]);
}

$stmtGet->close();
$stmt->close();
$conn->close();
?>