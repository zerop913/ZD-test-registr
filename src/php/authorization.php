<?php
require_once('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    $sql = "SELECT * FROM USERS WHERE username='$username' AND email='$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            echo "Добро пожаловать, " . $row['name'];
        } else {
            echo "Ошибка: Неверный логин, пароль или почта.";
        }
    } else {
        echo "Ошибка: Неверный логин, пароль или почта.";
    }
} else {
    echo "Ошибка: Недопустимый метод запроса.";
}

$conn->close();
?>