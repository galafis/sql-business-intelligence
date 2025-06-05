-- Calculate Sales Growth Function
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Function to calculate sales growth between two periods

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

DELIMITER //

CREATE OR REPLACE FUNCTION fn_calculate_sales_growth(
    p_current_sales DECIMAL(12, 2),
    p_previous_sales DECIMAL(12, 2)
)
RETURNS DECIMAL(10, 4)
DETERMINISTIC
BEGIN
    DECLARE v_growth DECIMAL(10, 4);
    
    -- Handle division by zero
    IF p_previous_sales IS NULL OR p_previous_sales = 0 THEN
        RETURN NULL;
    END IF;
    
    -- Calculate growth percentage
    SET v_growth = (p_current_sales - p_previous_sales) / p_previous_sales;
    
    RETURN v_growth;
END //

DELIMITER ;

