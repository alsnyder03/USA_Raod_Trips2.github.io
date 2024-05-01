<?php
// Database connection parameters
$db_servername = "localhost";
$db_username = "username";
$db_password = "password";
$db_name = "road_trip";

// Create database connection
$conn = new mysqli("localhost", "root", "", "road_trip");

// Check database connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve username and password from the form
$user_input_username = $_POST['username'];
$user_input_password = $_POST['password'];

// Prepare SQL statement to fetch user credentials from the database
$stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
$stmt->bind_param("s", $user_input_username);
$stmt->execute();
$result = $stmt->get_result();

// Check if user exists
if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    
    // Verify password
    if ($user_input_password === $user['password']) { // Compare plaintext passwords
        // Password is correct, start session
        session_start();
        $_SESSION['username'] = $user_input_username;
        echo "success"; // Return success message
    } else {
        // Password is incorrect
        echo "Invalid username or password";
    }
} else {
    // User does not exist
    echo "Invalid username or password";
}

$stmt->close();
$conn->close();
?>