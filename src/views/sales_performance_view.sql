-- Sales Performance View
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: View for analyzing sales performance by various dimensions

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

CREATE OR REPLACE VIEW reporting.vw_sales_performance AS
SELECT
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    d.day_of_month,
    d.day_name,
    c.customer_segment,
    c.city AS customer_city,
    c.state_province AS customer_state,
    c.country AS customer_country,
    p.product_category,
    p.product_subcategory,
    p.brand,
    s.store_name,
    s.store_type,
    s.city AS store_city,
    s.state_province AS store_state,
    s.country AS store_country,
    e.department,
    e.job_title,
    pr.promotion_name,
    pm.payment_method_name,
    sm.shipping_method_name,
    COUNT(DISTINCT fs.order_id) AS order_count,
    SUM(fs.quantity) AS total_quantity,
    SUM(fs.sales_amount) AS total_sales,
    SUM(fs.gross_profit) AS total_profit,
    SUM(fs.discount_amount) AS total_discount,
    SUM(fs.tax_amount) AS total_tax,
    SUM(fs.shipping_amount) AS total_shipping,
    SUM(fs.total_amount) AS total_revenue,
    SUM(fs.gross_profit) / SUM(fs.sales_amount) AS profit_margin,
    SUM(CASE WHEN fs.is_returned = TRUE THEN fs.sales_amount ELSE 0 END) AS returned_sales,
    SUM(CASE WHEN fs.is_returned = TRUE THEN 1 ELSE 0 END) AS return_count,
    SUM(CASE WHEN fs.is_returned = TRUE THEN fs.sales_amount ELSE 0 END) / 
        NULLIF(SUM(fs.sales_amount), 0) AS return_rate
FROM 
    fact_sales fs
JOIN 
    dim_date d ON fs.date_key = d.date_key
JOIN 
    dim_customer c ON fs.customer_key = c.customer_key
JOIN 
    dim_product p ON fs.product_key = p.product_key
JOIN 
    dim_store s ON fs.store_key = s.store_key
JOIN 
    dim_employee e ON fs.employee_key = e.employee_key
LEFT JOIN 
    dim_promotion pr ON fs.promotion_key = pr.promotion_key
JOIN 
    dim_payment_method pm ON fs.payment_method_key = pm.payment_method_key
LEFT JOIN 
    dim_shipping_method sm ON fs.shipping_method_key = sm.shipping_method_key
GROUP BY
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    d.day_of_month,
    d.day_name,
    c.customer_segment,
    c.city,
    c.state_province,
    c.country,
    p.product_category,
    p.product_subcategory,
    p.brand,
    s.store_name,
    s.store_type,
    s.city,
    s.state_province,
    s.country,
    e.department,
    e.job_title,
    pr.promotion_name,
    pm.payment_method_name,
    sm.shipping_method_name;

