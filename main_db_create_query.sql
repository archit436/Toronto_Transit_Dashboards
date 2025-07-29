-- Start by creating the database.
CREATE SCHEMA IF NOT EXISTS ttc_delay_data_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

-- Next we create the table for the streetcar data
-- We create a new variable to serve as key, but we also set a unique constraint to prevent duplicates.
-- We set date, route, time, delay, gap to not null since they are essential for analysis.
USE ttc_delay_data_db;
CREATE TABLE IF NOT EXISTS streetcar_delay_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_date DATE NOT NULL,
    route VARCHAR(20) NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    day VARCHAR(20),
    incident VARCHAR(255),
    min_delay DOUBLE CHECK (min_delay >= 0),
    min_gap DOUBLE CHECK (min_gap >= 0),
    direction VARCHAR(255),
    vehicle VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Unique constraint to prevent duplicates
    UNIQUE KEY unique_delay_incident (report_date, route, time, location)
);