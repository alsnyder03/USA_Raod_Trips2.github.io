<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>Destinations - USA Road Trip Planner</title>
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
                    <li><a href="trips.php">Plan Trips</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="logout.php">Logout</a></li> 
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="container">
            <section>
                <?php
                    // Connect to your database
                    $mysqli = new mysqli("localhost", "root", "", "road_trip");

                    // Check connection
                    if ($mysqli->connect_error) {
                        die("Connection failed: " . $mysqli->connect_error);
                    }

                    // Query to select destinations
                    $query = "SELECT * FROM destinations";

                    // Execute the query
                    $result = $mysqli->query($query);

                    // Check if there are any destinations
                    if ($result->num_rows > 0) {
                        // Loop through each row of destinations
                        while($row = $result->fetch_assoc()) {
                            echo '<div class="destination">';
                            echo '<h3>' . $row["destination_name"] . '</h3>';
                            echo '<p>' . $row["description"] . '</p>';
                            echo '</div>';
                        }
                    } else {
                        echo "No destinations found.";
                    }

                    // Close database connection
                    $mysqli->close();
                ?>

            </section>
        </div>
    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 USA Road Trip Planner</p>
        </div>
    </footer>
</body>
</html>