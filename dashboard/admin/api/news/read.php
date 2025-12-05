<?php
include_once '../config/database.php';

$page  = filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT);
if ($page === false || $page < 1) {
    $page = 1;
}
$limit = 4; 
$offset = ($page - 1) * $limit;
$search = trim($_GET['search'] ?? '');
$search = stripslashes($search);
$search = htmlspecialchars($search, ENT_QUOTES, 'UTF-8');
$searchTerm = "%" . $search . "%";
$sql = "SELECT *
        FROM news 
        WHERE title LIKE ? OR content LIKE ?
        ORDER BY created_at DESC 
        LIMIT ? 
        OFFSET ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssii", $searchTerm, $searchTerm, $limit, $offset); 

$stmt->execute();
$result = $stmt->get_result();
$news = $result->fetch_all(MYSQLI_ASSOC);

$sqlTotal = "SELECT COUNT(*) as total 
             FROM news 
             WHERE title LIKE ? OR content LIKE ?";

$stmtTotal = $conn->prepare($sqlTotal);
$stmtTotal->bind_param("ss", $searchTerm, $searchTerm);
$stmtTotal->execute();
$resultTotal = $stmtTotal->get_result();
$rowTotal = $resultTotal->fetch_assoc();
$total_rows = $rowTotal['total'];
$total_pages = ceil($total_rows / $limit);

echo json_encode([
    "data"       => $news,
    "pagination" => [
        "current_page"  => $page,
        "total_pages"   => $total_pages
    ]
]);

$stmt->close();
$stmtTotal->close();
$conn->close();
?>