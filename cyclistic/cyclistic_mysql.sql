CREATE TABLE april_trips (
    ride_id VARCHAR(30) NOT NULL,
    rideable_type VARCHAR(30) NOT NULL,
    started_at TIMESTAMP NOT NULL,
    ended_at TIMESTAMP NOT NULL,
    start_station_name VARCHAR(60) NOT NULL,
    start_station_id VARCHAR(30) NOT NULL,
    end_station_name VARCHAR(60) NOT NULL,
    end_station_id VARCHAR(30) NOT NULL,
    start_lat FLOAT NOT NULL,
    start_lng FLOAT NOT NULL,
    end_lat FLOAT NOT NULL,
    end_lng FLOAT NOT NULL,
    member_casual VARCHAR(30) NOT NULL
);

CREATE TABLE may_trips (
    ride_id VARCHAR(30) NOT NULL,
    rideable_type VARCHAR(30) NOT NULL,
    started_at TIMESTAMP NOT NULL,
    ended_at TIMESTAMP NOT NULL,
    start_station_name VARCHAR(60) NOT NULL,
    start_station_id VARCHAR(30) NOT NULL,
    end_station_name VARCHAR(60) NOT NULL,
    end_station_id VARCHAR(30) NOT NULL,
    start_lat FLOAT NOT NULL,
    start_lng FLOAT NOT NULL,
    end_lat FLOAT NOT NULL,
    end_lng FLOAT NOT NULL,
    member_casual VARCHAR(30) NOT NULL
);

CREATE TABLE june_trips (
    ride_id VARCHAR(30) NOT NULL,
    rideable_type VARCHAR(30) NOT NULL,
    started_at TIMESTAMP NOT NULL,
    ended_at TIMESTAMP NOT NULL,
    start_station_name VARCHAR(60) NOT NULL,
    start_station_id VARCHAR(30) NOT NULL,
    end_station_name VARCHAR(60) NOT NULL,
    end_station_id VARCHAR(30) NOT NULL,
    start_lat FLOAT NOT NULL,
    start_lng FLOAT NOT NULL,
    end_lat FLOAT NOT NULL,
    end_lng FLOAT NOT NULL,
    member_casual VARCHAR(30) NOT NULL
);

-- There are 426,590 rows in april_trips.
SELECT COUNT(*) 
FROM `cyclistic`.`april_trips`

-- There are 604,827 rows in may_trips.
SELECT COUNT(*) 
FROM `cyclistic`.`may_trips`

-- There are 719,618 rows in june_trips.
SELECT COUNT(*) 
FROM `cyclistic`.`june_trips`

-- Combine all 3 tables to get a complete Quarter 2 table.
CREATE TABLE cyclistic_q2 (
    SELECT * FROM `cyclistic`.`april_trips`
    UNION ALL 
    SELECT * FROM `cyclistic`.`may_trips`
    UNION ALL
    SELECT * FROM `cyclistic`.`june_trips`
)

-- Double check that all rows from each table were added. All rows were added.
SELECT COUNT(*)
FROM cyclistic_q2

/*
Remove null and blank values. Only return rows with no null or blank values.
There are no null values, only blank values. Columns start_station_name, start_station_id, 
end_station_name, end_station_id, end_lat, and end_lng have missing values.
*/
DELETE
FROM cyclistic_q2
WHERE start_station_name = ''
OR start_station_id = ''
OR end_station_name = ''
OR end_station_id = ''
OR end_lat = ''
OR end_lng = ''

/*
For each type of user (member vs. casual riders): what type of bike/transportation do they
use (bike_type), what day do they prefer to use Cyclistic, how long do they use the service for (average
ride duration), what percentage of Cyclister users are members vs. casual riders, and what
areas do they tend to start and end rides.
*/

-- Add columns (day_of_week, ride_length, route) to the table.

-- Add day of week to table.
ALTER TABLE cyclistic_q2
ADD day_of_week VARCHAR(30) AS 
(CASE WHEN DAYOFWEEK(started_at) = 1 THEN 'Sunday'
WHEN DAYOFWEEK(started_at) = 2 THEN 'Monday'
WHEN DAYOFWEEK(started_at) = 3 THEN 'Tuesday'
WHEN DAYOFWEEK(started_at) = 4 THEN 'Wednesday'
WHEN DAYOFWEEK(started_at) = 5 THEN 'Thursday'
WHEN DAYOFWEEK(started_at) = 6 THEN 'Friday'
WHEN DAYOFWEEK(started_at) = 7 THEN 'Saturday'
END);

-- Add ride length to table.

ALTER TABLE cyclistic_q2
ADD ride_length INT;

UPDATE cyclistic_q2
SET ride_length = TIMESTAMPDIFF(MINUTE, started_at, ended_at);

-- Add route to table.

ALTER TABLE cyclistic_q2
ADD route VARCHAR(150);

UPDATE cyclistic_q2
SET route = CONCAT(start_station_name, ' to ', end_station_name);

-- Start analysis with percentage of annual members vs. casual riders

SELECT member_casual, COUNT(*) / 1322180 AS percentage_user_type
FROM cyclistic_q2
GROUP BY member_casual

-- Number of rides by bike type

SELECT rideable_type, COUNT(*) AS total_rides
FROM cyclistic_q2
GROUP BY rideable_type

-- Number of rides by bike type by user (annual member vs. casual rider)

SELECT member_casual, rideable_type, COUNT(*) AS total_rides
FROM cyclistic_q2
GROUP BY member_casual, rideable_type

-- What is the average ride duration by each group of users?

SELECT member_casual, AVG(ride_length) AS avg_ride_length
FROM cyclistic_q2
WHERE ride_length > 0 AND ride_length < 720 -- Filter out rides that were longer than 12 hours.
GROUP BY member_casual

-- What day do users prefer to use Cyclistic?

SELECT member_casual, day_of_week, COUNT(*) AS num_rides
FROM cyclistic_q2
GROUP BY day_of_week, member_casual
ORDER BY member_casual, num_rides DESC

-- What areas do each type of users tend to start and end their rides?

SELECT member_casual, route, COUNT(*) AS num_rides
FROM cyclistic_q2
WHERE member_casual = 'member'
GROUP BY route
ORDER BY num_rides DESC
LIMIT 10;

SELECT member_casual, route, COUNT(*) AS num_rides
FROM cyclistic_q2
WHERE member_casual = 'casual'
GROUP BY route
ORDER BY num_rides DESC
LIMIT 10;




