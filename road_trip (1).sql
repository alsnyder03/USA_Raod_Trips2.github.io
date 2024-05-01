-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 02:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `road_trip`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int(11) NOT NULL,
  `destination_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `attractions` text DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destination_id`, `destination_name`, `city`, `state`, `description`, `attractions`, `rating`) VALUES
(1, 'Grand Canyon National Park', 'Grand Canyon Village', 'Arizona', 'A steep-sided canyon carved by the Colorado River.', 'Hiking, Rafting, Scenic views', 4.70),
(2, 'Yellowstone National Park', 'Yellowstone National Park', 'Wyoming', 'A vast, wild reserve atop a volcanic hot spot.', 'Geysers, Wildlife, Hiking trails', 4.80),
(3, 'Yosemite National Park', 'Yosemite Valley', 'California', 'A UNESCO World Heritage site in the Sierra Nevada mountains.', 'Waterfalls, Giant sequoias, Granite cliffs', 4.90),
(4, 'Great Smoky Mountains National Park', 'Gatlinburg', 'Tennessee', 'A subrange of the Appalachian Mountains.', 'Hiking, Wildlife viewing, Waterfalls', 4.60),
(5, 'Zion National Park', 'Springdale', 'Utah', 'A southwest Utah nature preserve.', 'Canyons, Scenic drives, Hiking trails', 4.80),
(6, 'Bryce Canyon National Park', 'Bryce Canyon City', 'Utah', 'A sprawling reserve in southern Utah.', 'Hiking trails, Hoodoos, Stargazing', 4.70),
(7, 'Glacier National Park', 'West Glacier', 'Montana', 'A wilderness area in Montana’s Rocky Mountains.', 'Hiking, Scenic drives, Wildlife', 4.70),
(8, 'Acadia National Park', 'Bar Harbor', 'Maine', 'A national park on Maine’s Mount Desert Island.', 'Hiking trails, Scenic drives, Coastline', 4.80),
(9, 'Mount Rainier National Park', 'Ashford', 'Washington', 'A massive stratovolcano in Washington state.', 'Hiking trails, Mountain climbing, Wildflowers', 4.70),
(10, 'Arches National Park', 'Moab', 'Utah', 'A red-rock wonderland in southern Utah.', 'Sandstone arches, Hiking trails, Scenic drives', 4.80),
(11, 'Rocky Mountain National Park', 'Estes Park', 'Colorado', 'A national park in Colorado’s northern Front Range.', 'Hiking trails, Wildlife viewing, Scenic drives', 4.80),
(12, 'Grand Teton National Park', 'Moose', 'Wyoming', 'A park in Wyoming’s Rockies.', 'Mountains, Lakes, Hiking trails', 4.80),
(13, 'Death Valley National Park', 'Death Valley Junction', 'California', 'A desert valley in eastern California.', 'Salt flats, Sand dunes, Badwater Basin', 4.60),
(14, 'Sequoia National Park', 'Three Rivers', 'California', 'A park in California’s Sierra Nevada mountains.', 'Giant sequoias, Hiking trails, Scenic drives', 4.80),
(15, 'Everglades National Park', 'Homestead', 'Florida', 'A park in southern Florida that protects diverse ecosystems.', 'Swamps, Wildlife, Airboat tours', 4.70);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `user_id`, `destination_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10),
(11, 6, 11),
(12, 6, 12),
(13, 7, 13),
(14, 7, 14),
(15, 8, 15),
(16, 8, 1),
(17, 9, 2),
(18, 9, 3),
(19, 10, 4),
(20, 10, 5),
(21, 11, 6),
(22, 11, 7),
(23, 12, 8),
(24, 12, 9),
(25, 13, 10),
(26, 13, 11),
(27, 14, 12),
(28, 14, 13),
(29, 15, 14),
(30, 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `date_posted` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `destination_id`, `user_id`, `rating`, `review_text`, `date_posted`) VALUES
(1, 1, 1, 5, 'Absolutely breathtaking!', '2024-05-05'),
(2, 1, 2, 4, 'A must-visit destination.', '2024-05-07'),
(3, 2, 3, 5, 'Incredible geysers!', '2024-06-18'),
(4, 2, 4, 4, 'Wildlife spotting was amazing.', '2024-06-20'),
(5, 3, 5, 5, 'Stunning natural beauty.', '2024-07-12'),
(6, 3, 6, 5, 'Unforgettable experience.', '2024-07-15'),
(7, 4, 7, 4, 'Lovely hiking trails.', '2024-08-08'),
(8, 4, 8, 4, 'Great views!', '2024-08-10'),
(9, 5, 9, 5, 'Zion is magical.', '2024-09-22'),
(10, 5, 10, 5, 'Hiking here was a dream.', '2024-09-25'),
(11, 6, 11, 4, 'Bryce Canyon is unique.', '2024-10-12'),
(12, 6, 12, 4, 'Stargazing was fantastic.', '2024-10-15'),
(13, 7, 13, 5, 'Glacier NP is stunningly beautiful.', '2024-11-07'),
(14, 7, 14, 5, 'Loved every moment here.', '2024-11-10'),
(15, 8, 15, 4, 'Acadia is a gem.', '2024-12-05'),
(16, 8, 1, 4, 'The coastline is spectacular.', '2024-12-08'),
(17, 9, 2, 5, 'Mount Rainier is majestic.', '2025-01-18'),
(18, 9, 3, 5, 'Wildflowers were in full bloom.', '2025-01-20'),
(19, 10, 4, 4, 'Arches is like another world.', '2025-02-12'),
(20, 10, 5, 4, 'Unforgettable landscapes.', '2025-02-15'),
(21, 11, 6, 5, 'Rocky Mountain NP is breathtaking.', '2025-03-08'),
(22, 11, 7, 5, 'Loved every minute of it.', '2025-03-10'),
(23, 12, 8, 4, 'Grand Teton is iconic.', '2025-04-03'),
(24, 12, 9, 4, 'The lakes are stunning.', '2025-04-05'),
(25, 13, 10, 5, 'Death Valley is surreal.', '2025-05-18'),
(26, 13, 11, 5, 'Unforgettable experience.', '2025-05-20'),
(27, 14, 12, 4, 'Sequoia NP is magical.', '2025-06-12'),
(28, 14, 13, 4, 'Giant sequoias are breathtaking.', '2025-06-15'),
(29, 15, 14, 5, 'Everglades NP is a must-visit.', '2025-07-08'),
(30, 15, 15, 5, 'Airboat tour was amazing.', '2025-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_distance` decimal(10,2) DEFAULT NULL,
  `total_duration` time DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`trip_id`, `destination`, `start_date`, `end_date`, `total_distance`, `total_duration`, `total_cost`) VALUES
(1, 'Grand Canyon National Park', '2024-05-01', '2024-05-10', 1500.00, '100:00:00', 1000.00),
(2, 'Yellowstone National Park', '2024-06-15', '2024-06-25', 2000.00, '120:00:00', 1200.00),
(3, 'Yosemite National Park', '2024-07-10', '2024-07-20', 1800.00, '110:00:00', 1100.00),
(4, 'Great Smoky Mountains National Park', '2024-08-05', '2024-08-15', 1700.00, '105:00:00', 1050.00),
(5, 'Zion National Park', '2024-09-20', '2024-09-30', 1900.00, '115:00:00', 1150.00),
(7, 'Ozark Lake', '2024-04-30', '2024-05-08', 250.00, '838:59:59', 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `trip_destinations`
--

CREATE TABLE `trip_destinations` (
  `trip_destination_id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `sequence_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_destinations`
--

INSERT INTO `trip_destinations` (`trip_destination_id`, `trip_id`, `destination_id`, `sequence_order`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 2, 4, 1),
(5, 2, 5, 2),
(6, 2, 6, 3),
(7, 3, 7, 1),
(8, 3, 8, 2),
(9, 3, 9, 3),
(10, 4, 10, 1),
(11, 4, 11, 2),
(12, 4, 12, 3),
(13, 5, 13, 1),
(14, 5, 14, 2),
(15, 5, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `trip_plans`
--

CREATE TABLE `trip_plans` (
  `trip_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_distance` decimal(10,2) DEFAULT NULL,
  `total_duration` time DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_plans`
--

INSERT INTO `trip_plans` (`trip_id`, `user_id`, `start_date`, `end_date`, `total_distance`, `total_duration`, `total_cost`) VALUES
(1, 1, '2024-05-01', '2024-05-10', 1500.00, '100:00:00', 1000.00),
(2, 2, '2024-06-15', '2024-06-25', 2000.00, '120:00:00', 1200.00),
(3, 3, '2024-07-10', '2024-07-20', 1800.00, '110:00:00', 1100.00),
(4, 4, '2024-08-05', '2024-08-15', 1700.00, '105:00:00', 1050.00),
(5, 5, '2024-09-20', '2024-09-30', 1900.00, '115:00:00', 1150.00),
(6, 6, '2024-10-10', '2024-10-20', 1600.00, '95:00:00', 950.00),
(7, 7, '2024-11-05', '2024-11-15', 1400.00, '90:00:00', 900.00),
(8, 8, '2024-12-01', '2024-12-10', 2100.00, '125:00:00', 1250.00),
(9, 9, '2025-01-15', '2025-01-25', 2200.00, '130:00:00', 1300.00),
(10, 10, '2025-02-10', '2025-02-20', 2300.00, '135:00:00', 1350.00),
(11, 11, '2025-03-05', '2025-03-15', 2400.00, '140:00:00', 1400.00),
(12, 12, '2025-04-01', '2025-04-10', 2500.00, '145:00:00', 1450.00),
(13, 13, '2025-05-15', '2025-05-25', 2600.00, '150:00:00', 1500.00),
(14, 14, '2025-06-10', '2025-06-20', 2700.00, '155:00:00', 1550.00),
(15, 15, '2025-07-05', '2025-07-15', 2800.00, '160:00:00', 1600.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `other_user_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `other_user_details`) VALUES
(1, 'user1', 'user1@example.com', 'password1', 'Other details for user 1'),
(2, 'user2', 'user2@example.com', 'password2', 'Other details for user 2'),
(3, 'user3', 'user3@example.com', 'password3', 'Other details for user 3'),
(4, 'user4', 'user4@example.com', 'password4', 'Other details for user 4'),
(5, 'user5', 'user5@example.com', 'password5', 'Other details for user 5'),
(6, 'user6', 'user6@example.com', 'password6', 'Other details for user 6'),
(7, 'user7', 'user7@example.com', 'password7', 'Other details for user 7'),
(8, 'user8', 'user8@example.com', 'password8', 'Other details for user 8'),
(9, 'user9', 'user9@example.com', 'password9', 'Other details for user 9'),
(10, 'user10', 'user10@example.com', 'password10', 'Other details for user 10'),
(11, 'user11', 'user11@example.com', 'password11', 'Other details for user 11'),
(12, 'user12', 'user12@example.com', 'password12', 'Other details for user 12'),
(13, 'user13', 'user13@example.com', 'password13', 'Other details for user 13'),
(14, 'user14', 'user14@example.com', 'password14', 'Other details for user 14'),
(15, 'user15', 'user15@example.com', 'password15', 'Other details for user 15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `destination_id` (`destination_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `trip_destinations`
--
ALTER TABLE `trip_destinations`
  ADD PRIMARY KEY (`trip_destination_id`),
  ADD KEY `trip_id` (`trip_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `trip_plans`
--
ALTER TABLE `trip_plans`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trip_destinations`
--
ALTER TABLE `trip_destinations`
  MODIFY `trip_destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `trip_plans`
--
ALTER TABLE `trip_plans`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `trip_destinations`
--
ALTER TABLE `trip_destinations`
  ADD CONSTRAINT `trip_destinations_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_plans` (`trip_id`),
  ADD CONSTRAINT `trip_destinations_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`);

--
-- Constraints for table `trip_plans`
--
ALTER TABLE `trip_plans`
  ADD CONSTRAINT `trip_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
