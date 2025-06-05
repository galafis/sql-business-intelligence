-- Load Sales Fact Stored Procedure
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Stored procedure to load the sales fact table from staging

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

DELIMITER //

CREATE OR REPLACE PROCEDURE sp_load_sales_fact(
    IN p_batch_date DATE
)
BEGIN
    DECLARE v_source_system VARCHAR(50);
    DECLARE v_records_inserted INT DEFAULT 0;
    DECLARE v_records_rejected INT DEFAULT 0;
    
    -- Set source system
    SET v_source_system = 'ERP_SYSTEM';
    
    -- Start transaction
    START TRANSACTION;
    
    -- Insert records from staging to fact table
    INSERT INTO fact_sales (
        date_key,
        customer_key,
        product_key,
        store_key,
        employee_key,
        promotion_key,
        payment_method_key,
        shipping_method_key,
        order_id,
        order_line_id,
        quantity,
        unit_price,
        unit_cost,
        discount_amount,
        sales_amount,
        gross_profit,
        tax_amount,
        shipping_amount,
        total_amount,
        is_returned,
        return_date_key,
        source_system
    )
    SELECT 
        dd.date_key,
        dc.customer_key,
        dp.product_key,
        ds.store_key,
        de.employee_key,
        dpr.promotion_key,
        dpm.payment_method_key,
        dsm.shipping_method_key,
        s.order_id,
        s.order_line_id,
        s.quantity,
        s.unit_price,
        s.unit_cost,
        s.discount_amount,
        s.sales_amount,
        s.gross_profit,
        s.tax_amount,
        s.shipping_amount,
        s.total_amount,
        s.is_returned,
        drd.date_key AS return_date_key,
        v_source_system
    FROM 
        staging.stg_sales s
    JOIN 
        dim_date dd ON dd.full_date = s.order_date
    JOIN 
        dim_customer dc ON dc.customer_id = s.customer_id AND dc.is_current = TRUE
    JOIN 
        dim_product dp ON dp.product_id = s.product_id AND dp.is_current = TRUE
    JOIN 
        dim_store ds ON ds.store_id = s.store_id AND ds.is_current = TRUE
    JOIN 
        dim_employee de ON de.employee_id = s.employee_id AND de.is_current = TRUE
    LEFT JOIN 
        dim_promotion dpr ON dpr.promotion_id = s.promotion_id AND dpr.is_current = TRUE
    JOIN 
        dim_payment_method dpm ON dpm.payment_method_id = s.payment_method_id AND dpm.is_current = TRUE
    LEFT JOIN 
        dim_shipping_method dsm ON dsm.shipping_method_id = s.shipping_method_id AND dsm.is_current = TRUE
    LEFT JOIN 
        dim_date drd ON drd.full_date = s.return_date
    WHERE 
        s.batch_date = p_batch_date
        AND NOT EXISTS (
            SELECT 1 
            FROM fact_sales fs 
            WHERE fs.order_id = s.order_id 
              AND fs.order_line_id = s.order_line_id
        );
    
    -- Get the number of records inserted
    SET v_records_inserted = ROW_COUNT();
    
    -- Insert rejected records into error log table
    INSERT INTO metadata.etl_error_log (
        batch_date,
        source_table,
        target_table,
        error_message,
        record_data,
        created_at
    )
    SELECT 
        p_batch_date,
        'stg_sales',
        'fact_sales',
        CONCAT('Missing dimension key for: ', 
               CASE 
                   WHEN dd.date_key IS NULL THEN 'date_key' 
                   WHEN dc.customer_key IS NULL THEN 'customer_key'
                   WHEN dp.product_key IS NULL THEN 'product_key'
                   WHEN ds.store_key IS NULL THEN 'store_key'
                   WHEN de.employee_key IS NULL THEN 'employee_key'
                   WHEN dpm.payment_method_key IS NULL THEN 'payment_method_key'
                   ELSE 'unknown'
               END),
        CONCAT('order_id: ', s.order_id, ', order_line_id: ', s.order_line_id),
        NOW()
    FROM 
        staging.stg_sales s
    LEFT JOIN 
        dim_date dd ON dd.full_date = s.order_date
    LEFT JOIN 
        dim_customer dc ON dc.customer_id = s.customer_id AND dc.is_current = TRUE
    LEFT JOIN 
        dim_product dp ON dp.product_id = s.product_id AND dp.is_current = TRUE
    LEFT JOIN 
        dim_store ds ON ds.store_id = s.store_id AND ds.is_current = TRUE
    LEFT JOIN 
        dim_employee de ON de.employee_id = s.employee_id AND de.is_current = TRUE
    LEFT JOIN 
        dim_payment_method dpm ON dpm.payment_method_id = s.payment_method_id AND dpm.is_current = TRUE
    WHERE 
        s.batch_date = p_batch_date
        AND (dd.date_key IS NULL OR dc.customer_key IS NULL OR dp.product_key IS NULL OR 
             ds.store_key IS NULL OR de.employee_key IS NULL OR dpm.payment_method_key IS NULL);
    
    -- Get the number of records rejected
    SET v_records_rejected = ROW_COUNT();
    
    -- Update the ETL log
    INSERT INTO metadata.etl_log (
        batch_date,
        source_table,
        target_table,
        records_read,
        records_inserted,
        records_rejected,
        start_time,
        end_time,
        status,
        message
    )
    VALUES (
        p_batch_date,
        'stg_sales',
        'fact_sales',
        v_records_inserted + v_records_rejected,
        v_records_inserted,
        v_records_rejected,
        NOW(),
        NOW(),
        'COMPLETED',
        CONCAT('Successfully loaded ', v_records_inserted, ' records into fact_sales. ', 
               v_records_rejected, ' records were rejected.')
    );
    
    -- Commit transaction
    COMMIT;
    
    -- Return the results
    SELECT 
        p_batch_date AS batch_date,
        v_records_inserted AS records_inserted,
        v_records_rejected AS records_rejected,
        'COMPLETED' AS status;
END //

DELIMITER ;

