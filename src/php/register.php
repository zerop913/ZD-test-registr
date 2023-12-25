<?php
require_once('db.php');

$lastname = $_POST['lastname'];
$name = $_POST['name'];
$patronymic = $_POST['patronymic'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];

$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

$sql = "INSERT INTO USERS (lastname, name, patronymic, phone, email, username, password)
VALUES ('$lastname', '$name', '$patronymic', '$phone', '$email', '$username', '$hashedPassword')";

if ($conn->query($sql) === TRUE) {
    echo "Регистрация прошла успешно";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>