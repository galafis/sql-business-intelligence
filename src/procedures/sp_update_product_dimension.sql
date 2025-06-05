-- Update Product Dimension Stored Procedure
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Stored procedure to update the product dimension table using SCD Type 2

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

DELIMITER //

CREATE OR REPLACE PROCEDURE sp_update_product_dimension(
    IN p_effective_date DATE
)
BEGIN
    DECLARE v_source_system VARCHAR(50);
    DECLARE v_expiration_date DATE;
    
    -- Set source system and expiration date
    SET v_source_system = 'ERP_SYSTEM';
    SET v_expiration_date = '9999-12-31';
    
    -- Start transaction
    START TRANSACTION;
    
    -- Insert new products
    INSERT INTO dim_product (
        product_id,
        product_name,
        product_description,
        product_category,
        product_subcategory,
        brand,
        manufacturer,
        sku,
        upc,
        unit_cost,
        unit_price,
        weight,
        weight_unit,
        size,
        color,
        product_status,
        effective_date,
        expiration_date,
        is_current,
        source_system
    )
    SELECT 
        s.product_id,
        s.product_name,
        s.product_description,
        s.product_category,
        s.product_subcategory,
        s.brand,
        s.manufacturer,
        s.sku,
        s.upc,
        s.unit_cost,
        s.unit_price,
        s.weight,
        s.weight_unit,
        s.size,
        s.color,
        s.product_status,
        p_effective_date,
        v_expiration_date,
        TRUE,
        v_source_system
    FROM 
        staging.stg_product s
    LEFT JOIN 
        dim_product d ON s.product_id = d.product_id AND d.is_current = TRUE
    WHERE 
        d.product_id IS NULL;
    
    -- Update changed products (SCD Type 2)
    -- First, expire the current records
    UPDATE dim_product d
    JOIN staging.stg_product s ON d.product_id = s.product_id
    SET 
        d.expiration_date = DATE_SUB(p_effective_date, INTERVAL 1 DAY),
        d.is_current = FALSE
    WHERE 
        d.is_current = TRUE
        AND (
            d.product_name != s.product_name OR
            IFNULL(d.product_description, '') != IFNULL(s.product_description, '') OR
            d.product_category != s.product_category OR
            IFNULL(d.product_subcategory, '') != IFNULL(s.product_subcategory, '') OR
            IFNULL(d.brand, '') != IFNULL(s.brand, '') OR
            IFNULL(d.manufacturer, '') != IFNULL(s.manufacturer, '') OR
            IFNULL(d.sku, '') != IFNULL(s.sku, '') OR
            IFNULL(d.upc, '') != IFNULL(s.upc, '') OR
            IFNULL(d.unit_cost, 0) != IFNULL(s.unit_cost, 0) OR
            IFNULL(d.unit_price, 0) != IFNULL(s.unit_price, 0) OR
            IFNULL(d.weight, 0) != IFNULL(s.weight, 0) OR
            IFNULL(d.weight_unit, '') != IFNULL(s.weight_unit, '') OR
            IFNULL(d.size, '') != IFNULL(s.size, '') OR
            IFNULL(d.color, '') != IFNULL(s.color, '') OR
            d.product_status != s.product_status
        );
    
    -- Then, insert new records for the changed products
    INSERT INTO dim_product (
        product_id,
        product_name,
        product_description,
        product_category,
        product_subcategory,
        brand,
        manufacturer,
        sku,
        upc,
        unit_cost,
        unit_price,
        weight,
        weight_unit,
        size,
        color,
        product_status,
        effective_date,
        expiration_date,
        is_current,
        source_system
    )
    SELECT 
        s.product_id,
        s.product_name,
        s.product_description,
        s.product_category,
        s.product_subcategory,
        s.brand,
        s.manufacturer,
        s.sku,
        s.upc,
        s.unit_cost,
        s.unit_price,
        s.weight,
        s.weight_unit,
        s.size,
        s.color,
        s.product_status,
        p_effective_date,
        v_expiration_date,
        TRUE,
        v_source_system
    FROM 
        staging.stg_product s
    JOIN 
        dim_product d ON s.product_id = d.product_id
    WHERE 
        d.expiration_date = DATE_SUB(p_effective_date, INTERVAL 1 DAY)
        AND d.is_current = FALSE;
    
    -- Commit transaction
    COMMIT;
    
    -- Return the number of records inserted and updated
    SELECT 
        (SELECT COUNT(*) FROM dim_product WHERE effective_date = p_effective_date) AS records_processed,
        (SELECT COUNT(*) FROM dim_product WHERE is_current = TRUE) AS current_records;
END //

DELIMITER ;

