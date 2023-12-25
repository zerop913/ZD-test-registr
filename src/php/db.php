<?php

$servername = "172.20.7.6";
$username = "st";
$password = "pwd";
$dbname = "drive-school";

$conn = pg_connect($servername, $username, $password, $dbname);

if(!$conn){
    die("Connection Failed". pg_connect());
} else {
    "Success";
}

?>