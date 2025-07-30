create database bookMyMovies;
use bookMyMovies;

-- Create fresh database with same structure
DROP DATABASE IF EXISTS bookMyMovies;
CREATE DATABASE bookMyMovies;
USE bookMyMovies;

-- Users table (same structure)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);

-- Movies table (same structure)
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(40) NOT NULL,
    lang VARCHAR(30) NOT NULL,
    duration INT NOT NULL COMMENT 'in minutes'
);

-- Theater table (same structure)
CREATE TABLE theater (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Shows table (same structure)
CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    theater_id INT NOT NULL,
    timing VARCHAR(30) NOT NULL,
    available_seats INT NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);

-- Seat table (same structure)
CREATE TABLE seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(show_id) REFERENCES shows(show_id)
);

-- Booking table (same structure)
CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    seat_booked VARCHAR(255) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(show_id) REFERENCES shows(show_id)
);

-- Insert users from all 10 cities (3 users per city)
INSERT INTO users (name, email, phone_number) VALUES
-- Delhi
('Aarav Gupta', 'aarav.delhi@example.com', '9810010001'),
('Priya Sharma', 'priya.delhi@example.com', '9810010002'),
('Rohan Malhotra', 'rohan.delhi@example.com', '9810010003'),

-- Noida
('Ananya Singh', 'ananya.noida@example.com', '9810020001'),
('Vihaan Reddy', 'vihaan.noida@example.com', '9810020002'),
('Ishaan Patel', 'ishaan.noida@example.com', '9810020003'),

-- Greater Noida
('Diya Verma', 'diya.greaternoida@example.com', '9810030001'),
('Reyansh Kumar', 'reyansh.greaternoida@example.com', '9810030002'),
('Saanvi Joshi', 'saanvi.greaternoida@example.com', '9810030003'),

-- Ghaziabad
('Arjun Mishra', 'arjun.ghaziabad@example.com', '9810040001'),
('Kavya Singh', 'kavya.ghaziabad@example.com', '9810040002'),
('Aditya Sharma', 'aditya.ghaziabad@example.com', '9810040003'),

-- Gurgaon
('Anika Gupta', 'anika.gurgaon@example.com', '9810050001'),
('Kabir Malhotra', 'kabir.gurgaon@example.com', '9810050002'),
('Neha Reddy', 'neha.gurgaon@example.com', '9810050003'),

-- Faridabad
('Vivaan Patel', 'vivaan.faridabad@example.com', '9810060001'),
('Ishita Verma', 'ishita.faridabad@example.com', '9810060002'),
('Dhruv Kumar', 'dhruv.faridabad@example.com', '9810060003'),

-- Sonipat
('Myra Sharma', 'myra.sonipat@example.com', '9810070001'),
('Ayaan Singh', 'ayaan.sonipat@example.com', '9810070002'),
('Kiara Joshi', 'kiara.sonipat@example.com', '9810070003'),

-- Meerut
('Advait Gupta', 'advait.meerut@example.com', '9810080001'),
('Pari Malhotra', 'pari.meerut@example.com', '9810080002'),
('Yuvan Reddy', 'yuvan.meerut@example.com', '9810080003'),

-- Panipat
('Anvi Patel', 'anvi.panipat@example.com', '9810090001'),
('Rudra Verma', 'rudra.panipat@example.com', '9810090002'),
('Siya Kumar', 'siya.panipat@example.com', '9810090003'),

-- Rohtak
('Vihaan Sharma', 'vihaan.rohtak@example.com', '9810100001'),
('Disha Singh', 'disha.rohtak@example.com', '9810100002'),
('Arnav Joshi', 'arnav.rohtak@example.com', '9810100003');

-- Insert 12 current popular movies
INSERT INTO movies (title, genre, lang, duration) VALUES
('Pathaan', 'Action', 'Hindi', 146),
('Jawan', 'Action', 'Hindi', 169),
('Dunki', 'Drama', 'Hindi', 158),
('Animal', 'Action', 'Hindi', 201),
('12th Fail', 'Drama', 'Hindi', 147),
('Fighter', 'Action', 'Hindi', 166),
('Shaitaan', 'Thriller', 'Hindi', 132),
('Teri Baaton Mein Aisa Uljha Jiya', 'Romance', 'Hindi', 138),
('Bade Miyan Chote Miyan', 'Action', 'Hindi', 150),
('Crew', 'Comedy', 'Hindi', 125),
('Maidaan', 'Sports', 'Hindi', 180),
('Swatantrya Veer Savarkar', 'Biography', 'Hindi', 165);

-- Insert 3-5 theaters in each of 10 cities (40 total)
INSERT INTO theater (name, city) VALUES
-- Delhi (5)
('PVR Saket', 'Delhi'),
('INOX Nehru Place', 'Delhi'),
('Cinepolis Janak Place', 'Delhi'),
('M2K Cinemas', 'Delhi'),
('PVR Select Citywalk', 'Delhi'),

-- Noida (4)
('Wave Cinemas', 'Noida'),
('Cinepolis Noida', 'Noida'),
('PVR Logix City Center', 'Noida'),
('GIP PVR', 'Noida'),

-- Greater Noida (3)
('GIP Mall Multiplex', 'Greater Noida'),
('The Great India Place', 'Greater Noida'),
('Cinepolis Omaxe', 'Greater Noida'),

-- Ghaziabad (4)
('PVR Sahibabad', 'Ghaziabad'),
('Wave Cinemas Vasundhara', 'Ghaziabad'),
('M3M Cinepolis', 'Ghaziabad'),
('Fun Cinemas', 'Ghaziabad'),

-- Gurgaon (5)
('PVR Ambience Mall', 'Gurgaon'),
('INOX Sector 29', 'Gurgaon'),
('Cinepolis MG Road', 'Gurgaon'),
('DT Cinemas', 'Gurgaon'),
('SRS Cinemas', 'Gurgaon'),

-- Faridabad (3)
('Crown Interiorz Mall', 'Faridabad'),
('SRS Mall', 'Faridabad'),
('Fun Republic', 'Faridabad'),

-- Sonipat (3)
('PVR The Legacy', 'Sonipat'),
('INOX Aravali Mall', 'Sonipat'),
('Cinepolis Shopprix', 'Sonipat'),

-- Meerut (4)
('SRS Cinemas', 'Meerut'),
('Meerut Cineplex', 'Meerut'),
('Big Cinemas', 'Meerut'),
('PVR Empress City', 'Meerut'),

-- Panipat (3)
('PVR Centra Mall', 'Panipat'),
('INOX City Centre', 'Panipat'),
('Cinepolis Urban Estate', 'Panipat'),

-- Rohtak (3)
('PVR Tilyar Mall', 'Rohtak'),
('INOX Galleria Market', 'Rohtak'),
('Cinepolis Star Mall', 'Rohtak');

-- Insert shows for ALL movies in ALL theaters (3 shows per movie per theater)
INSERT INTO shows (movie_id, theater_id, timing, available_seats)
WITH movie_theater AS (
    SELECT m.movie_id, t.theater_id
    FROM movies m
    CROSS JOIN theater t
),
show_times AS (
    SELECT '10:00 AM' AS time UNION
    SELECT '02:00 PM' UNION
    SELECT '06:00 PM'
)
SELECT 
    mt.movie_id,
    mt.theater_id,
    st.time,
    CASE 
        WHEN t.city IN ('Delhi', 'Gurgaon') THEN 120  -- Larger capacity in metro cities
        ELSE 100                                      -- Standard capacity elsewhere
    END AS available_seats
FROM 
    movie_theater mt
JOIN 
    theater t ON mt.theater_id = t.theater_id
CROSS JOIN 
    show_times st
ORDER BY 
    mt.theater_id, mt.movie_id;

-- Insert seats (A1-A10, B1-B10 for each show - 20 seats per show)
INSERT INTO seat (show_id, seat_number, is_booked)
SELECT 
    s.show_id,
    CONCAT(r.row_letter, n.num) AS seat_number,
    FALSE AS is_booked
FROM 
    shows s
CROSS JOIN 
    (SELECT 'A' AS row_letter UNION SELECT 'B') r
CROSS JOIN 
    (
        SELECT 1 AS num UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
        UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
    ) n
ORDER BY 
    s.show_id;


-- Create 300 realistic bookings linked to users' cities
-- Step 1: Insert bookings for 300 users
INSERT INTO booking (user_id, show_id, seat_booked, total_price)
SELECT 
    u.user_id,
    s.show_id,
    GROUP_CONCAT(st.seat_number ORDER BY RAND() SEPARATOR ',') AS seat_booked,
    COUNT(st.seat_number) * 200 AS total_price
FROM (
    SELECT * FROM users ORDER BY RAND() LIMIT 300
) u
JOIN theater t ON 
    CASE
        WHEN u.email LIKE '%delhi%' THEN 'Delhi'
        WHEN u.email LIKE '%noida%' THEN 'Noida'
        WHEN u.email LIKE '%greaternoida%' THEN 'Greater Noida'
        WHEN u.email LIKE '%ghaziabad%' THEN 'Ghaziabad'
        WHEN u.email LIKE '%gurgaon%' THEN 'Gurgaon'
        WHEN u.email LIKE '%faridabad%' THEN 'Faridabad'
        WHEN u.email LIKE '%sonipat%' THEN 'Sonipat'
        WHEN u.email LIKE '%meerut%' THEN 'Meerut'
        WHEN u.email LIKE '%panipat%' THEN 'Panipat'
        WHEN u.email LIKE '%rohtak%' THEN 'Rohtak'
        ELSE 'Delhi'
    END = t.city
JOIN shows s ON s.theater_id = t.theater_id
JOIN seat st ON st.show_id = s.show_id
WHERE st.is_booked = FALSE
GROUP BY u.user_id, s.show_id
HAVING COUNT(st.seat_number) >= 1
LIMIT 300;



-- Update booked seats status
UPDATE seat s
JOIN (
    SELECT 
        b.show_id, 
        SUBSTRING_INDEX(SUBSTRING_INDEX(b.seat_booked, ',', n.n), ',', -1) AS seat_number
    FROM 
        booking b
    JOIN 
        (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) n
    ON 
        n.n <= LENGTH(b.seat_booked) - LENGTH(REPLACE(b.seat_booked, ',', '')) + 1
) AS booked ON s.show_id = booked.show_id AND s.seat_number = booked.seat_number
SET s.is_booked = TRUE;