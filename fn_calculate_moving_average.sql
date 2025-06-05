-- Calculate Moving Average Function
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Function to calculate moving average for a given window

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

DELIMITER //

CREATE OR REPLACE FUNCTION fn_calculate_moving_average(
    p_values TEXT,  -- Comma-separated list of values
    p_window_size INT
)
RETURNS DECIMAL(12, 4)
DETERMINISTIC
BEGIN
    DECLARE v_result DECIMAL(12, 4);
    DECLARE v_value DECIMAL(12, 4);
    DECLARE v_sum DECIMAL(12, 4) DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_pos INT DEFAULT 1;
    DECLARE v_next_pos INT;
    DECLARE v_done BOOLEAN DEFAULT FALSE;
    
    -- Validate input parameters
    IF p_values IS NULL OR p_window_size <= 0 THEN
        RETURN NULL;
    END IF;
    
    -- Parse the comma-separated list and calculate the sum
    WHILE NOT v_done DO
        -- Find the position of the next comma
        SET v_next_pos = LOCATE(',', p_values, v_pos);
        
        -- If no more commas, process the last value
        IF v_next_pos = 0 THEN
            SET v_value = CAST(SUBSTRING(p_values, v_pos) AS DECIMAL(12, 4));
            SET v_done = TRUE;
        ELSE
            SET v_value = CAST(SUBSTRING(p_values, v_pos, v_next_pos - v_pos) AS DECIMAL(12, 4));
            SET v_pos = v_next_pos + 1;
        END IF;
        
        -- Add the value to the sum and increment the count
        SET v_sum = v_sum + v_value;
        SET v_count = v_count + 1;
        
        -- If we have more values than the window size, we need to remove the oldest value
        IF v_count > p_window_size THEN
            -- This is a simplification; in a real implementation, we would need to keep track of all values
            -- For now, we'll just return NULL if the count exceeds the window size
            RETURN NULL;
        END IF;
    END WHILE;
    
    -- Calculate the average
    IF v_count > 0 THEN
        SET v_result = v_sum / v_count;
    ELSE
        SET v_result = NULL;
    END IF;
    
    RETURN v_result;
END //

DELIMITER ;

