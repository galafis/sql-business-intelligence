-- Marketing Campaign View
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: View for analyzing marketing campaign performance

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

CREATE OR REPLACE VIEW reporting.vw_marketing_campaign AS
SELECT
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    fmc.campaign_id,
    fmc.campaign_name,
    fmc.channel,
    pr.promotion_name,
    pr.discount_type,
    pr.discount_amount,
    pr.discount_percent,
    SUM(fmc.impressions) AS total_impressions,
    SUM(fmc.clicks) AS total_clicks,
    SUM(fmc.unique_visitors) AS total_unique_visitors,
    SUM(fmc.conversions) AS total_conversions,
    SUM(fmc.cost) AS total_cost,
    SUM(fmc.revenue) AS total_revenue,
    SUM(fmc.revenue - fmc.cost) AS total_profit,
    AVG(fmc.roi) AS avg_roi,
    AVG(fmc.ctr) AS avg_ctr,
    AVG(fmc.conversion_rate) AS avg_conversion_rate,
    AVG(fmc.cost_per_acquisition) AS avg_cost_per_acquisition,
    SUM(fmc.clicks) / NULLIF(SUM(fmc.impressions), 0) AS overall_ctr,
    SUM(fmc.conversions) / NULLIF(SUM(fmc.clicks), 0) AS overall_conversion_rate,
    SUM(fmc.cost) / NULLIF(SUM(fmc.conversions), 0) AS overall_cost_per_acquisition,
    SUM(fmc.revenue - fmc.cost) / NULLIF(SUM(fmc.cost), 0) AS overall_roi
FROM 
    fact_marketing_campaign fmc
JOIN 
    dim_date d ON fmc.date_key = d.date_key
LEFT JOIN 
    dim_promotion pr ON fmc.promotion_key = pr.promotion_key
GROUP BY
    d.year_num,
    d.quarter_num,
    d.month_num,
    d.month_name,
    fmc.campaign_id,
    fmc.campaign_name,
    fmc.channel,
    pr.promotion_name,
    pr.discount_type,
    pr.discount_amount,
    pr.discount_percent;

