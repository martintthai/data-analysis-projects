SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE 'E:/Downloads/202304-divvy-tripdata.csv'
INTO TABLE april_trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)

LOAD DATA LOCAL INFILE 'E:/Downloads/202305-divvy-tripdata.csv'
INTO TABLE may_trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)

LOAD DATA LOCAL INFILE 'E:/Downloads/202306-divvy-tripdata.csv'
INTO TABLE june_trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
