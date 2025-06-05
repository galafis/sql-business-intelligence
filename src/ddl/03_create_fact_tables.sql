-- Business Intelligence Fact Tables Creation
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Creates the fact tables for the Business Intelligence star schema

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

-- Create Sales Fact Table
CREATE TABLE IF NOT EXISTS fact_sales (
    sales_key BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    store_key INT NOT NULL,
    employee_key INT NOT NULL,
    promotion_key INT,
    payment_method_key INT NOT NULL,
    shipping_method_key INT,
    order_id VARCHAR(20) NOT NULL,
    order_line_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    unit_cost DECIMAL(10, 2) NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL DEFAULT 0,
    sales_amount DECIMAL(10, 2) NOT NULL,
    gross_profit DECIMAL(10, 2) NOT NULL,
    tax_amount DECIMAL(10, 2) NOT NULL DEFAULT 0,
    shipping_amount DECIMAL(10, 2) NOT NULL DEFAULT 0,
    total_amount DECIMAL(10, 2) NOT NULL,
    is_returned BOOLEAN NOT NULL DEFAULT FALSE,
    return_date_key INT,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (employee_key) REFERENCES dim_employee(employee_key),
    FOREIGN KEY (promotion_key) REFERENCES dim_promotion(promotion_key),
    FOREIGN KEY (payment_method_key) REFERENCES dim_payment_method(payment_method_key),
    FOREIGN KEY (shipping_method_key) REFERENCES dim_shipping_method(shipping_method_key),
    FOREIGN KEY (return_date_key) REFERENCES dim_date(date_key)
);

-- Create Inventory Fact Table
CREATE TABLE IF NOT EXISTS fact_inventory (
    inventory_key BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    product_key INT NOT NULL,
    store_key INT NOT NULL,
    quantity_on_hand INT NOT NULL,
    quantity_on_order INT NOT NULL DEFAULT 0,
    quantity_reserved INT NOT NULL DEFAULT 0,
    quantity_available INT NOT NULL,
    quantity_min_stock INT NOT NULL,
    quantity_max_stock INT NOT NULL,
    days_of_supply INT,
    inventory_value DECIMAL(12, 2) NOT NULL,
    is_stock_out BOOLEAN NOT NULL DEFAULT FALSE,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);

-- Create Customer Satisfaction Fact Table
CREATE TABLE IF NOT EXISTS fact_customer_satisfaction (
    satisfaction_key BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    customer_key INT NOT NULL,
    product_key INT,
    store_key INT,
    employee_key INT,
    order_id VARCHAR(20),
    satisfaction_score INT NOT NULL,
    nps_score INT,
    review_text TEXT,
    sentiment_score DECIMAL(5, 2),
    response_time_minutes INT,
    issue_resolved BOOLEAN,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (employee_key) REFERENCES dim_employee(employee_key)
);

-- Create Marketing Campaign Fact Table
CREATE TABLE IF NOT EXISTS fact_marketing_campaign (
    campaign_key BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    promotion_key INT,
    campaign_id VARCHAR(20) NOT NULL,
    campaign_name VARCHAR(100) NOT NULL,
    channel VARCHAR(50) NOT NULL,
    impressions INT NOT NULL DEFAULT 0,
    clicks INT NOT NULL DEFAULT 0,
    unique_visitors INT NOT NULL DEFAULT 0,
    conversions INT NOT NULL DEFAULT 0,
    cost DECIMAL(12, 2) NOT NULL,
    revenue DECIMAL(12, 2) NOT NULL DEFAULT 0,
    roi DECIMAL(10, 4),
    ctr DECIMAL(10, 4),
    conversion_rate DECIMAL(10, 4),
    cost_per_acquisition DECIMAL(10, 2),
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (promotion_key) REFERENCES dim_promotion(promotion_key)
);

-- Create Employee Performance Fact Table
CREATE TABLE IF NOT EXISTS fact_employee_performance (
    performance_key BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    employee_key INT NOT NULL,
    store_key INT NOT NULL,
    sales_count INT NOT NULL DEFAULT 0,
    sales_amount DECIMAL(12, 2) NOT NULL DEFAULT 0,
    average_transaction_value DECIMAL(10, 2),
    items_sold INT NOT NULL DEFAULT 0,
    hours_worked DECIMAL(5, 2) NOT NULL,
    customers_served INT NOT NULL DEFAULT 0,
    returns_processed INT NOT NULL DEFAULT 0,
    returns_amount DECIMAL(12, 2) NOT NULL DEFAULT 0,
    customer_satisfaction_score DECIMAL(3, 2),
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (employee_key) REFERENCES dim_employee(employee_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);

-- Create indexes for better query performance
CREATE INDEX idx_fact_sales_date ON fact_sales(date_key);
CREATE INDEX idx_fact_sales_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_sales_product ON fact_sales(product_key);
CREATE INDEX idx_fact_sales_store ON fact_sales(store_key);
CREATE INDEX idx_fact_sales_employee ON fact_sales(employee_key);

CREATE INDEX idx_fact_inventory_date ON fact_inventory(date_key);
CREATE INDEX idx_fact_inventory_product ON fact_inventory(product_key);
CREATE INDEX idx_fact_inventory_store ON fact_inventory(store_key);

CREATE INDEX idx_fact_customer_satisfaction_date ON fact_customer_satisfaction(date_key);
CREATE INDEX idx_fact_customer_satisfaction_customer ON fact_customer_satisfaction(customer_key);

CREATE INDEX idx_fact_marketing_campaign_date ON fact_marketing_campaign(date_key);
CREATE INDEX idx_fact_marketing_campaign_promotion ON fact_marketing_campaign(promotion_key);

CREATE INDEX idx_fact_employee_performance_date ON fact_employee_performance(date_key);
CREATE INDEX idx_fact_employee_performance_employee ON fact_employee_performance(employee_key);
CREATE INDEX idx_fact_employee_performance_store ON fact_employee_performance(store_key);

