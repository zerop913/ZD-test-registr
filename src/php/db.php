<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = mysql_connect($servername, $username, $password, $dbname);

if(!$conn){
    die("Connection Failed". mysql_connect());
} else {
    "Success";
}

?>
