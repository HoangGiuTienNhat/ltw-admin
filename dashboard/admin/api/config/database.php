<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$host = "localhost";
$username = "root";
$password = "123123";
$db_name = "techstore_db";

$conn = new mysqli($host, $username, $password, $db_name);

if ($conn->connect_error) {
    die(json_encode(["message" => "Lỗi kết nối: " . $conn->connect_error]));
}

$conn->set_charset("utf8");
?>