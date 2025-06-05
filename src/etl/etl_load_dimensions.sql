-- ETL Script for Loading Dimensions
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: ETL script to load all dimension tables from staging

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

-- Set variables
SET @batch_date = CURRENT_DATE();
SET @source_system = 'ERP_SYSTEM';
SET @expiration_date = '9999-12-31';

-- Start transaction
START TRANSACTION;

-- Load Date Dimension
CALL sp_generate_date_dimension('2020-01-01', '2025-12-31');

-- Load Customer Dimension (SCD Type 2)
-- First, expire the current records that have changed
UPDATE dim_customer d
JOIN staging.stg_customer s ON d.customer_id = s.customer_id
SET 
    d.expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY),
    d.is_current = FALSE
WHERE 
    d.is_current = TRUE
    AND (
        d.customer_name != s.customer_name OR
        IFNULL(d.customer_email, '') != IFNULL(s.customer_email, '') OR
        IFNULL(d.customer_phone, '') != IFNULL(s.customer_phone, '') OR
        IFNULL(d.address_line1, '') != IFNULL(s.address_line1, '') OR
        IFNULL(d.address_line2, '') != IFNULL(s.address_line2, '') OR
        IFNULL(d.city, '') != IFNULL(s.city, '') OR
        IFNULL(d.state_province, '') != IFNULL(s.state_province, '') OR
        IFNULL(d.postal_code, '') != IFNULL(s.postal_code, '') OR
        IFNULL(d.country, '') != IFNULL(s.country, '') OR
        IFNULL(d.customer_segment, '') != IFNULL(s.customer_segment, '') OR
        IFNULL(d.customer_type, '') != IFNULL(s.customer_type, '') OR
        d.customer_status != s.customer_status
    );

-- Then, insert new records for the changed customers
INSERT INTO dim_customer (
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    address_line1,
    address_line2,
    city,
    state_province,
    postal_code,
    country,
    customer_segment,
    customer_type,
    customer_status,
    registration_date,
    effective_date,
    expiration_date,
    is_current,
    source_system
)
SELECT 
    s.customer_id,
    s.customer_name,
    s.customer_email,
    s.customer_phone,
    s.address_line1,
    s.address_line2,
    s.city,
    s.state_province,
    s.postal_code,
    s.country,
    s.customer_segment,
    s.customer_type,
    s.customer_status,
    s.registration_date,
    @batch_date,
    @expiration_date,
    TRUE,
    @source_system
FROM 
    staging.stg_customer s
JOIN 
    dim_customer d ON s.customer_id = d.customer_id
WHERE 
    d.expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY)
    AND d.is_current = FALSE;

-- Insert new customers
INSERT INTO dim_customer (
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    address_line1,
    address_line2,
    city,
    state_province,
    postal_code,
    country,
    customer_segment,
    customer_type,
    customer_status,
    registration_date,
    effective_date,
    expiration_date,
    is_current,
    source_system
)
SELECT 
    s.customer_id,
    s.customer_name,
    s.customer_email,
    s.customer_phone,
    s.address_line1,
    s.address_line2,
    s.city,
    s.state_province,
    s.postal_code,
    s.country,
    s.customer_segment,
    s.customer_type,
    s.customer_status,
    s.registration_date,
    @batch_date,
    @expiration_date,
    TRUE,
    @source_system
FROM 
    staging.stg_customer s
LEFT JOIN 
    dim_customer d ON s.customer_id = d.customer_id
WHERE 
    d.customer_id IS NULL;

-- Load Product Dimension
CALL sp_update_product_dimension(@batch_date);

-- Load Store Dimension (SCD Type 2)
-- First, expire the current records that have changed
UPDATE dim_store d
JOIN staging.stg_store s ON d.store_id = s.store_id
SET 
    d.expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY),
    d.is_current = FALSE
WHERE 
    d.is_current = TRUE
    AND (
        d.store_name != s.store_name OR
        IFNULL(d.store_type, '') != IFNULL(s.store_type, '') OR
        IFNULL(d.address_line1, '') != IFNULL(s.address_line1, '') OR
        IFNULL(d.address_line2, '') != IFNULL(s.address_line2, '') OR
        IFNULL(d.city, '') != IFNULL(s.city, '') OR
        IFNULL(d.state_province, '') != IFNULL(s.state_province, '') OR
        IFNULL(d.postal_code, '') != IFNULL(s.postal_code, '') OR
        IFNULL(d.country, '') != IFNULL(s.country, '') OR
        IFNULL(d.phone_number, '') != IFNULL(s.phone_number, '') OR
        IFNULL(d.manager_name, '') != IFNULL(s.manager_name, '') OR
        IFNULL(d.square_footage, 0) != IFNULL(s.square_footage, 0) OR
        d.store_status != s.store_status
    );

-- Then, insert new records for the changed stores
INSERT INTO dim_store (
    store_id,
    store_name,
    store_type,
    address_line1,
    address_line2,
    city,
    state_province,
    postal_code,
    country,
    phone_number,
    manager_name,
    open_date,
    close_date,
    square_footage,
    store_status,
    effective_date,
    expiration_date,
    is_current,
    source_system
)
SELECT 
    s.store_id,
    s.store_name,
    s.store_type,
    s.address_line1,
    s.address_line2,
    s.city,
    s.state_province,
    s.postal_code,
    s.country,
    s.phone_number,
    s.manager_name,
    s.open_date,
    s.close_date,
    s.square_footage,
    s.store_status,
    @batch_date,
    @expiration_date,
    TRUE,
    @source_system
FROM 
    staging.stg_store s
JOIN 
    dim_store d ON s.store_id = d.store_id
WHERE 
    d.expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY)
    AND d.is_current = FALSE;

-- Insert new stores
INSERT INTO dim_store (
    store_id,
    store_name,
    store_type,
    address_line1,
    address_line2,
    city,
    state_province,
    postal_code,
    country,
    phone_number,
    manager_name,
    open_date,
    close_date,
    square_footage,
    store_status,
    effective_date,
    expiration_date,
    is_current,
    source_system
)
SELECT 
    s.store_id,
    s.store_name,
    s.store_type,
    s.address_line1,
    s.address_line2,
    s.city,
    s.state_province,
    s.postal_code,
    s.country,
    s.phone_number,
    s.manager_name,
    s.open_date,
    s.close_date,
    s.square_footage,
    s.store_status,
    @batch_date,
    @expiration_date,
    TRUE,
    @source_system
FROM 
    staging.stg_store s
LEFT JOIN 
    dim_store d ON s.store_id = d.store_id
WHERE 
    d.store_id IS NULL;

-- Load Employee Dimension (similar pattern for other dimensions)
-- ... (code for other dimensions follows the same pattern)

-- Commit transaction
COMMIT;

-- Log the ETL process
INSERT INTO metadata.etl_log (
    batch_date,
    source_table,
    target_table,
    records_read,
    records_inserted,
    records_updated,
    start_time,
    end_time,
    status,
    message
)
VALUES (
    @batch_date,
    'staging',
    'dimensions',
    (SELECT COUNT(*) FROM staging.stg_customer) + 
    (SELECT COUNT(*) FROM staging.stg_product) + 
    (SELECT COUNT(*) FROM staging.stg_store),
    (SELECT COUNT(*) FROM dim_customer WHERE effective_date = @batch_date) + 
    (SELECT COUNT(*) FROM dim_product WHERE effective_date = @batch_date) + 
    (SELECT COUNT(*) FROM dim_store WHERE effective_date = @batch_date),
    (SELECT COUNT(*) FROM dim_customer WHERE expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY)) + 
    (SELECT COUNT(*) FROM dim_product WHERE expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY)) + 
    (SELECT COUNT(*) FROM dim_store WHERE expiration_date = DATE_SUB(@batch_date, INTERVAL 1 DAY)),
    NOW(),
    NOW(),
    'COMPLETED',
    'Successfully loaded dimension tables'
);

