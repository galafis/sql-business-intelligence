-- Employee Performance View
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: View for analyzing employee performance metrics

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

CREATE OR REPLACE VIEW reporting.vw_employee_performance AS
SELECT
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    e.employee_id,
    e.full_name AS employee_name,
    e.job_title,
    e.department,
    s.store_name,
    s.store_type,
    s.city AS store_city,
    s.state_province AS store_state,
    s.country AS store_country,
    SUM(fep.sales_count) AS total_sales_count,
    SUM(fep.sales_amount) AS total_sales_amount,
    AVG(fep.average_transaction_value) AS avg_transaction_value,
    SUM(fep.items_sold) AS total_items_sold,
    SUM(fep.hours_worked) AS total_hours_worked,
    SUM(fep.customers_served) AS total_customers_served,
    SUM(fep.returns_processed) AS total_returns_processed,
    SUM(fep.returns_amount) AS total_returns_amount,
    AVG(fep.customer_satisfaction_score) AS avg_customer_satisfaction,
    SUM(fep.sales_amount) / NULLIF(SUM(fep.hours_worked), 0) AS sales_per_hour,
    SUM(fep.items_sold) / NULLIF(SUM(fep.sales_count), 0) AS items_per_transaction,
    SUM(fep.customers_served) / NULLIF(SUM(fep.hours_worked), 0) AS customers_per_hour,
    SUM(fep.returns_amount) / NULLIF(SUM(fep.sales_amount), 0) AS returns_ratio
FROM 
    fact_employee_performance fep
JOIN 
    dim_date d ON fep.date_key = d.date_key
JOIN 
    dim_employee e ON fep.employee_key = e.employee_key
JOIN 
    dim_store s ON fep.store_key = s.store_key
GROUP BY
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    e.employee_id,
    e.full_name,
    e.job_title,
    e.department,
    s.store_name,
    s.store_type,
    s.city,
    s.state_province,
    s.country;

