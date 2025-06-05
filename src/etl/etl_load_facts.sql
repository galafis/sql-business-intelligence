-- ETL Script for Loading Fact Tables
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: ETL script to load all fact tables from staging

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

-- Set variables
SET @batch_date = CURRENT_DATE();
SET @source_system = 'ERP_SYSTEM';

-- Start transaction
START TRANSACTION;

-- Load Sales Fact Table
CALL sp_load_sales_fact(@batch_date);

-- Load Inventory Fact Table
INSERT INTO fact_inventory (
    date_key,
    product_key,
    store_key,
    quantity_on_hand,
    quantity_on_order,
    quantity_reserved,
    quantity_available,
    quantity_min_stock,
    quantity_max_stock,
    days_of_supply,
    inventory_value,
    is_stock_out,
    source_system
)
SELECT 
    dd.date_key,
    dp.product_key,
    ds.store_key,
    s.quantity_on_hand,
    s.quantity_on_order,
    s.quantity_reserved,
    s.quantity_available,
    s.quantity_min_stock,
    s.quantity_max_stock,
    s.days_of_supply,
    s.inventory_value,
    s.is_stock_out,
    @source_system
FROM 
    staging.stg_inventory s
JOIN 
    dim_date dd ON dd.full_date = s.inventory_date
JOIN 
    dim_product dp ON dp.product_id = s.product_id AND dp.is_current = TRUE
JOIN 
    dim_store ds ON ds.store_id = s.store_id AND ds.is_current = TRUE
WHERE 
    s.batch_date = @batch_date
    AND NOT EXISTS (
        SELECT 1 
        FROM fact_inventory fi 
        WHERE fi.date_key = dd.date_key 
          AND fi.product_key = dp.product_key 
          AND fi.store_key = ds.store_key
    );

-- Load Customer Satisfaction Fact Table
INSERT INTO fact_customer_satisfaction (
    date_key,
    customer_key,
    product_key,
    store_key,
    employee_key,
    order_id,
    satisfaction_score,
    nps_score,
    review_text,
    sentiment_score,
    response_time_minutes,
    issue_resolved,
    source_system
)
SELECT 
    dd.date_key,
    dc.customer_key,
    dp.product_key,
    ds.store_key,
    de.employee_key,
    s.order_id,
    s.satisfaction_score,
    s.nps_score,
    s.review_text,
    s.sentiment_score,
    s.response_time_minutes,
    s.issue_resolved,
    @source_system
FROM 
    staging.stg_customer_satisfaction s
JOIN 
    dim_date dd ON dd.full_date = s.review_date
JOIN 
    dim_customer dc ON dc.customer_id = s.customer_id AND dc.is_current = TRUE
LEFT JOIN 
    dim_product dp ON dp.product_id = s.product_id AND dp.is_current = TRUE
LEFT JOIN 
    dim_store ds ON ds.store_id = s.store_id AND ds.is_current = TRUE
LEFT JOIN 
    dim_employee de ON de.employee_id = s.employee_id AND de.is_current = TRUE
WHERE 
    s.batch_date = @batch_date
    AND NOT EXISTS (
        SELECT 1 
        FROM fact_customer_satisfaction fcs 
        WHERE fcs.date_key = dd.date_key 
          AND fcs.customer_key = dc.customer_key 
          AND IFNULL(fcs.order_id, '') = IFNULL(s.order_id, '')
    );

-- Load Marketing Campaign Fact Table
INSERT INTO fact_marketing_campaign (
    date_key,
    promotion_key,
    campaign_id,
    campaign_name,
    channel,
    impressions,
    clicks,
    unique_visitors,
    conversions,
    cost,
    revenue,
    roi,
    ctr,
    conversion_rate,
    cost_per_acquisition,
    source_system
)
SELECT 
    dd.date_key,
    dp.promotion_key,
    s.campaign_id,
    s.campaign_name,
    s.channel,
    s.impressions,
    s.clicks,
    s.unique_visitors,
    s.conversions,
    s.cost,
    s.revenue,
    s.roi,
    s.ctr,
    s.conversion_rate,
    s.cost_per_acquisition,
    @source_system
FROM 
    staging.stg_marketing_campaign s
JOIN 
    dim_date dd ON dd.full_date = s.campaign_date
LEFT JOIN 
    dim_promotion dp ON dp.promotion_id = s.promotion_id AND dp.is_current = TRUE
WHERE 
    s.batch_date = @batch_date
    AND NOT EXISTS (
        SELECT 1 
        FROM fact_marketing_campaign fmc 
        WHERE fmc.date_key = dd.date_key 
          AND fmc.campaign_id = s.campaign_id 
          AND fmc.channel = s.channel
    );

-- Load Employee Performance Fact Table
INSERT INTO fact_employee_performance (
    date_key,
    employee_key,
    store_key,
    sales_count,
    sales_amount,
    average_transaction_value,
    items_sold,
    hours_worked,
    customers_served,
    returns_processed,
    returns_amount,
    customer_satisfaction_score,
    source_system
)
SELECT 
    dd.date_key,
    de.employee_key,
    ds.store_key,
    s.sales_count,
    s.sales_amount,
    s.average_transaction_value,
    s.items_sold,
    s.hours_worked,
    s.customers_served,
    s.returns_processed,
    s.returns_amount,
    s.customer_satisfaction_score,
    @source_system
FROM 
    staging.stg_employee_performance s
JOIN 
    dim_date dd ON dd.full_date = s.performance_date
JOIN 
    dim_employee de ON de.employee_id = s.employee_id AND de.is_current = TRUE
JOIN 
    dim_store ds ON ds.store_id = s.store_id AND ds.is_current = TRUE
WHERE 
    s.batch_date = @batch_date
    AND NOT EXISTS (
        SELECT 1 
        FROM fact_employee_performance fep 
        WHERE fep.date_key = dd.date_key 
          AND fep.employee_key = de.employee_key 
          AND fep.store_key = ds.store_key
    );

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
    'facts',
    (SELECT COUNT(*) FROM staging.stg_sales WHERE batch_date = @batch_date) + 
    (SELECT COUNT(*) FROM staging.stg_inventory WHERE batch_date = @batch_date) + 
    (SELECT COUNT(*) FROM staging.stg_customer_satisfaction WHERE batch_date = @batch_date) + 
    (SELECT COUNT(*) FROM staging.stg_marketing_campaign WHERE batch_date = @batch_date) + 
    (SELECT COUNT(*) FROM staging.stg_employee_performance WHERE batch_date = @batch_date),
    (SELECT COUNT(*) FROM fact_sales WHERE created_at >= CURDATE()) + 
    (SELECT COUNT(*) FROM fact_inventory WHERE created_at >= CURDATE()) + 
    (SELECT COUNT(*) FROM fact_customer_satisfaction WHERE created_at >= CURDATE()) + 
    (SELECT COUNT(*) FROM fact_marketing_campaign WHERE created_at >= CURDATE()) + 
    (SELECT COUNT(*) FROM fact_employee_performance WHERE created_at >= CURDATE()),
    0,
    NOW(),
    NOW(),
    'COMPLETED',
    'Successfully loaded fact tables'
);

