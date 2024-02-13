<?php
// Allow requests from http://localhost:8080
header('Access-Control-Allow-Origin: http://localhost:8080');
// Allow other headers to be sent in the request
header('Access-Control-Allow-Headers: *');
// Allow the request method (e.g., GET)
header('Access-Control-Allow-Methods: GET');

header('Content-Type: application/json');

// Generate a random number
$randomNumber = rand(1, 100);

// Return the random number as JSON
echo json_encode(['number' => $randomNumber]);
?>
