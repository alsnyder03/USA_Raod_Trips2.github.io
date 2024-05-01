<?php
// Database connection
$mysqli = new mysqli("localhost", "root", "", "road_trip");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Retrieve POST data
$tripId = $_POST['trip_id'];
$destination = $_POST['destination'];
$startDate = $_POST['start_date'];
$endDate = $_POST['end_date'];
$totalDistance = $_POST['total_distance'];
$totalDuration = $_POST['total_duration'];
$totalCost = $_POST['total_cost'];

// Prepare and bind SQL statement
$query = "UPDATE trips SET destination=?, start_date=?, end_date=?, 
          total_distance=?, total_duration=?, total_cost=? WHERE trip_id=?";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("ssssssi", $destination, $startDate, $endDate, $totalDistance, $totalDuration, $totalCost, $tripId);

// Execute SQL statement
if ($stmt->execute()) {
    echo "Trip updated successfully";
} else {
    echo "Error updating trip: " . $stmt->error;
}

// Close statement and database connection
$stmt->close();
$mysqli->close();
?>