-- Customer Satisfaction View
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: View for analyzing customer satisfaction metrics

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

CREATE OR REPLACE VIEW reporting.vw_customer_satisfaction AS
SELECT
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
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
    e.department,
    e.job_title,
    COUNT(fcs.satisfaction_key) AS review_count,
    AVG(fcs.satisfaction_score) AS avg_satisfaction_score,
    AVG(fcs.nps_score) AS avg_nps_score,
    AVG(fcs.sentiment_score) AS avg_sentiment_score,
    AVG(fcs.response_time_minutes) AS avg_response_time_minutes,
    SUM(CASE WHEN fcs.issue_resolved = TRUE THEN 1 ELSE 0 END) / 
        NULLIF(COUNT(fcs.satisfaction_key), 0) AS issue_resolution_rate,
    SUM(CASE WHEN fcs.satisfaction_score >= 4 THEN 1 ELSE 0 END) / 
        NULLIF(COUNT(fcs.satisfaction_key), 0) AS high_satisfaction_rate,
    SUM(CASE WHEN fcs.satisfaction_score <= 2 THEN 1 ELSE 0 END) / 
        NULLIF(COUNT(fcs.satisfaction_key), 0) AS low_satisfaction_rate,
    SUM(CASE WHEN fcs.nps_score >= 9 THEN 1 
             WHEN fcs.nps_score <= 6 THEN -1
             ELSE 0 END) / 
        NULLIF(COUNT(fcs.satisfaction_key), 0) AS net_promoter_score
FROM 
    fact_customer_satisfaction fcs
JOIN 
    dim_date d ON fcs.date_key = d.date_key
JOIN 
    dim_customer c ON fcs.customer_key = c.customer_key
LEFT JOIN 
    dim_product p ON fcs.product_key = p.product_key
LEFT JOIN 
    dim_store s ON fcs.store_key = s.store_key
LEFT JOIN 
    dim_employee e ON fcs.employee_key = e.employee_key
GROUP BY
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
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
    e.department,
    e.job_title;

