-- Generate Date Dimension Stored Procedure
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Stored procedure to generate the date dimension table with a specified date range

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

DELIMITER //

CREATE OR REPLACE PROCEDURE sp_generate_date_dimension(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    DECLARE current_date DATE;
    DECLARE day_of_week INT;
    DECLARE day_name VARCHAR(10);
    DECLARE day_of_month INT;
    DECLARE day_of_year INT;
    DECLARE week_of_year INT;
    DECLARE month_num INT;
    DECLARE month_name VARCHAR(10);
    DECLARE quarter_num INT;
    DECLARE year_num INT;
    DECLARE fiscal_quarter INT;
    DECLARE fiscal_year INT;
    DECLARE is_weekend BOOLEAN;
    DECLARE is_holiday BOOLEAN;
    DECLARE holiday_name VARCHAR(50);
    
    -- Validate input parameters
    IF start_date IS NULL OR end_date IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date and end date must not be NULL';
    END IF;
    
    IF start_date > end_date THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date must be less than or equal to end date';
    END IF;
    
    -- Delete existing records if they exist in the specified range
    DELETE FROM dim_date 
    WHERE full_date BETWEEN start_date AND end_date;
    
    -- Set the current date to the start date
    SET current_date = start_date;
    
    -- Loop through each date in the range
    WHILE current_date <= end_date DO
        -- Calculate date attributes
        SET day_of_week = DAYOFWEEK(current_date);
        SET day_name = DAYNAME(current_date);
        SET day_of_month = DAYOFMONTH(current_date);
        SET day_of_year = DAYOFYEAR(current_date);
        SET week_of_year = WEEKOFYEAR(current_date);
        SET month_num = MONTH(current_date);
        SET month_name = MONTHNAME(current_date);
        SET quarter_num = QUARTER(current_date);
        SET year_num = YEAR(current_date);
        
        -- Calculate fiscal year and quarter (assuming fiscal year starts in July)
        IF month_num >= 7 THEN
            SET fiscal_year = year_num + 1;
            SET fiscal_quarter = quarter_num - 2;
        ELSE
            SET fiscal_year = year_num;
            SET fiscal_quarter = quarter_num + 2;
        END IF;
        
        -- Determine if it's a weekend
        SET is_weekend = (day_of_week = 1 OR day_of_week = 7);
        
        -- Initialize holiday flags
        SET is_holiday = FALSE;
        SET holiday_name = NULL;
        
        -- Check for common US holidays (simplified)
        -- New Year's Day
        IF month_num = 1 AND day_of_month = 1 THEN
            SET is_holiday = TRUE;
            SET holiday_name = 'New Year''s Day';
        END IF;
        
        -- Independence Day
        IF month_num = 7 AND day_of_month = 4 THEN
            SET is_holiday = TRUE;
            SET holiday_name = 'Independence Day';
        END IF;
        
        -- Christmas
        IF month_num = 12 AND day_of_month = 25 THEN
            SET is_holiday = TRUE;
            SET holiday_name = 'Christmas';
        END IF;
        
        -- Insert the record into the date dimension table
        INSERT INTO dim_date (
            date_key,
            full_date,
            day_of_week,
            day_name,
            day_of_month,
            day_of_year,
            week_of_year,
            month_num,
            month_name,
            quarter_num,
            year_num,
            fiscal_quarter,
            fiscal_year,
            is_weekend,
            is_holiday,
            holiday_name
        ) VALUES (
            YEAR(current_date) * 10000 + MONTH(current_date) * 100 + DAY(current_date), -- date_key as YYYYMMDD
            current_date,
            day_of_week,
            day_name,
            day_of_month,
            day_of_year,
            week_of_year,
            month_num,
            month_name,
            quarter_num,
            year_num,
            fiscal_quarter,
            fiscal_year,
            is_weekend,
            is_holiday,
            holiday_name
        );
        
        -- Move to the next date
        SET current_date = DATE_ADD(current_date, INTERVAL 1 DAY);
    END WHILE;
    
    -- Return the number of records inserted
    SELECT CONCAT('Generated date dimension from ', start_date, ' to ', end_date, 
                 '. Total records: ', DATEDIFF(end_date, start_date) + 1) AS result;
END //

DELIMITER ;

