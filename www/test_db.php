<?php

$DBuser = 'root';
#$DBpass = $_ENV['MYSQL_ROOT_PASSWORD'];
$DBpass = 'root';
$pdo = null;

try{
    $database = 'mysql:host=192.168.100.51;port=3306';
    $pdo = new PDO($database, $DBuser, $DBpass);
    echo "Success: A proper connection to MySQL was made! The docker database is great.";    
} catch(PDOException $e) {
    echo "Error: Unable to connect to MySQL. Error:\n $e";
}

$pdo = null;
?>
