-- Inventory Analysis View
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: View for analyzing inventory levels and stock performance

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

CREATE OR REPLACE VIEW reporting.vw_inventory_analysis AS
SELECT
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    d.day_of_month,
    p.product_category,
    p.product_subcategory,
    p.product_name,
    p.brand,
    s.store_name,
    s.store_type,
    s.city AS store_city,
    s.state_province AS store_state,
    s.country AS store_country,
    SUM(fi.quantity_on_hand) AS total_on_hand,
    SUM(fi.quantity_on_order) AS total_on_order,
    SUM(fi.quantity_reserved) AS total_reserved,
    SUM(fi.quantity_available) AS total_available,
    SUM(fi.inventory_value) AS total_inventory_value,
    AVG(fi.days_of_supply) AS avg_days_of_supply,
    SUM(CASE WHEN fi.is_stock_out = TRUE THEN 1 ELSE 0 END) AS stock_out_count,
    SUM(CASE WHEN fi.quantity_on_hand < fi.quantity_min_stock THEN 1 ELSE 0 END) AS low_stock_count,
    SUM(CASE WHEN fi.quantity_on_hand > fi.quantity_max_stock THEN 1 ELSE 0 END) AS overstock_count,
    SUM(fi.quantity_on_hand) / NULLIF(SUM(fi.quantity_max_stock), 0) AS inventory_fill_rate,
    SUM(fi.inventory_value) / COUNT(DISTINCT s.store_key) AS avg_inventory_value_per_store,
    SUM(fi.inventory_value) / COUNT(DISTINCT p.product_key) AS avg_inventory_value_per_product
FROM 
    fact_inventory fi
JOIN 
    dim_date d ON fi.date_key = d.date_key
JOIN 
    dim_product p ON fi.product_key = p.product_key
JOIN 
    dim_store s ON fi.store_key = s.store_key
GROUP BY
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    d.day_of_month,
    p.product_category,
    p.product_subcategory,
    p.product_name,
    p.brand,
    s.store_name,
    s.store_type,
    s.city,
    s.state_province,
    s.country;

