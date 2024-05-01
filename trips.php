<?php
// Database connection
$mysqli = new mysqli("localhost", "root", "", "road_trip");

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Create or update trip
if (isset($_POST['submit'])) {
    $trip_id = $_POST['trip_id'];
    $destination = $_POST['destination'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];
    $total_distance = $_POST['total_distance'];
    $total_duration = $_POST['total_duration'];
    $total_cost = $_POST['total_cost'];

    if (empty($trip_id)) {
        // Create new trip
        $query = "INSERT INTO trips (destination, start_date, end_date, total_distance, total_duration, total_cost) 
                  VALUES ('$destination', '$start_date', '$end_date', '$total_distance', '$total_duration', '$total_cost')";
    } else {
        // Update existing trip
        $query = "UPDATE trips SET destination='$destination', start_date='$start_date', end_date='$end_date', 
                  total_distance='$total_distance', total_duration='$total_duration', total_cost='$total_cost' WHERE trip_id=$trip_id";
    }

    if ($mysqli->query($query) === TRUE) {
        echo "Trip saved successfully";
    } else {
        echo "Error: " . $query . "<br>" . $mysqli->error;
    }
}

// Delete trip
if (isset($_GET['delete'])) {
    $trip_id = $_GET['delete'];
    $query = "DELETE FROM trips WHERE trip_id=$trip_id";
    if ($mysqli->query($query) === TRUE) {
        echo "Trip deleted successfully";
    } else {
        echo "Error: " . $query . "<br>" . $mysqli->error;
    }
}

// Fetch all trips
$query = "SELECT * FROM trips";
$result = $mysqli->query($query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - USA Road Trip Planner</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>USA Road Trip Planner</h1>
            <nav>
                <ul>
                    <li><a href="home.html">Home</a></li>
                    <li><a href="destinations.php">Destinations</a></li>
                    <li><a href="trips.html">Plan Trips</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="logout.php">Logout</a></li> 
                </ul>
            </nav>
        </div>
    </header>
    <main>
    <div class="container">
        <h2>Trips</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Destination</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Total Distance</th>
                        <th>Total Duration</th>
                        <th>Total Cost</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $row['trip_id']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['destination']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['start_date']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['end_date']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['total_distance']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['total_duration']; ?></td>
                            <td contenteditable="true" class="editable" data-id="<?php echo $row['trip_id']; ?>"><?php echo $row['total_cost']; ?></td>
                            <td>
                                <button class="update-btn" data-id="<?php echo $row['trip_id']; ?>">Update</button>
                                <a href='?delete=<?php echo $row['trip_id']; ?>' onclick='return confirm("Are you sure you want to delete this trip?")'>Delete</a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
        <h2>Add/Edit Trip</h2>
        <form method="post" class="trip-form">
            <input type="hidden" name="trip_id" value="">
            <div class="form-group">
                <label for="destination">Destination:</label>
                <input type="text" id="destination" name="destination" required>
            </div>
            <div class="form-group">
                <label for="start_date">Start Date:</label>
                <input type ="date" id="start_date" name="start_date" required>
            </div>
            <div class="form-group">
                <label for="end_date">End Date:</label>
                <input type="date" id="end_date" name="end_date" required>
            </div>
            <div class="form-group">
                <label for="total_distance">Total Distance:</label>
                <input type="number" id="total_distance" name="total_distance" required>
            </div>
            <div class="form-group">
                <label for="total_duration">Total Duration:</label>
                <input type="text" id="total_duration" name="total_duration" required>
            </div>
            <div class="form-group">
                <label for="total_cost">Total Cost:</label>
                <input type="number" id="total_cost" name="total_cost" required>
            </div>
            <button type="submit" name="submit">Submit</button>
        </form>
    </div>
</main>
    <footer>
        <div class="container">
            <p>&copy; 2024 USA Road Trip Planner</p>
        </div>
    </footer>
</body>
<script>
// Update trip details using AJAX
document.querySelectorAll('.update-btn').forEach(button => {
    button.addEventListener('click', function() {
        const tripId = this.getAttribute('data-id');
        const destination = document.querySelector(`.editable[data-id="${tripId}"][data-column="destination"]`).innerText;
        const startDate = document.querySelector(`.editable[data-id="${tripId}"][data-column="start_date"]`).innerText;
        const endDate = document.querySelector(`.editable[data-id="${tripId}"][data-column="end_date"]`).innerText;
        const totalDistance = document.querySelector(`.editable[data-id="${tripId}"][data-column="total_distance"]`).innerText;
        const totalDuration = document.querySelector(`.editable[data-id="${tripId}"][data-column="total_duration"]`).innerText;
        const totalCost = document.querySelector(`.editable[data-id="${tripId}"][data-column="total_cost"]`).innerText;

        // Log the data to debug
        console.log("Updating trip:");
        console.log("Trip ID:", tripId);
        console.log("Destination:", destination);
        console.log("Start Date:", startDate);
        console.log("End Date:", endDate);
        console.log("Total Distance:", totalDistance);
        console.log("Total Duration:", totalDuration);
        console.log("Total Cost:", totalCost);

        // Perform AJAX update to update the database
        const formData = new FormData();
        formData.append('trip_id', tripId);
        formData.append('destination', destination);
        formData.append('start_date', startDate);
        formData.append('end_date', endDate);
        formData.append('total_distance', totalDistance);
        formData.append('total_duration', totalDuration);
        formData.append('total_cost', totalCost);

        fetch('update_trip.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
});
</script>
</html>

<?php
// Close database connection
$mysqli->close();
?>