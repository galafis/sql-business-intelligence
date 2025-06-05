-- Business Intelligence Dimension Tables Creation
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Creates the dimension tables for the Business Intelligence star schema

-- Use the database
USE business_intelligence;
SET search_path TO dim_model, public;

-- Create Date Dimension
CREATE TABLE IF NOT EXISTS dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week INT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    day_of_month INT NOT NULL,
    day_of_year INT NOT NULL,
    week_of_year INT NOT NULL,
    month_num INT NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    quarter_num INT NOT NULL,
    year_num INT NOT NULL,
    fiscal_quarter INT NOT NULL,
    fiscal_year INT NOT NULL,
    is_weekend BOOLEAN NOT NULL,
    is_holiday BOOLEAN NOT NULL,
    holiday_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Customer Dimension
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_phone VARCHAR(20),
    address_line1 VARCHAR(100),
    address_line2 VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    customer_segment VARCHAR(50),
    customer_type VARCHAR(50),
    customer_status VARCHAR(20) NOT NULL,
    registration_date DATE,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (customer_id, effective_date)
);

-- Create Product Dimension
CREATE TABLE IF NOT EXISTS dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(20) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    product_category VARCHAR(50) NOT NULL,
    product_subcategory VARCHAR(50),
    brand VARCHAR(50),
    manufacturer VARCHAR(100),
    sku VARCHAR(50),
    upc VARCHAR(20),
    unit_cost DECIMAL(10, 2),
    unit_price DECIMAL(10, 2),
    weight DECIMAL(10, 2),
    weight_unit VARCHAR(10),
    size VARCHAR(20),
    color VARCHAR(20),
    product_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (product_id, effective_date)
);

-- Create Store Dimension
CREATE TABLE IF NOT EXISTS dim_store (
    store_key INT AUTO_INCREMENT PRIMARY KEY,
    store_id VARCHAR(20) NOT NULL,
    store_name VARCHAR(100) NOT NULL,
    store_type VARCHAR(50),
    address_line1 VARCHAR(100),
    address_line2 VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone_number VARCHAR(20),
    manager_name VARCHAR(100),
    open_date DATE,
    close_date DATE,
    square_footage INT,
    store_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (store_id, effective_date)
);

-- Create Employee Dimension
CREATE TABLE IF NOT EXISTS dim_employee (
    employee_key INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    department VARCHAR(50),
    manager_id VARCHAR(20),
    hire_date DATE,
    termination_date DATE,
    salary DECIMAL(12, 2),
    email VARCHAR(100),
    phone VARCHAR(20),
    address_line1 VARCHAR(100),
    address_line2 VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    employee_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (employee_id, effective_date)
);

-- Create Promotion Dimension
CREATE TABLE IF NOT EXISTS dim_promotion (
    promotion_key INT AUTO_INCREMENT PRIMARY KEY,
    promotion_id VARCHAR(20) NOT NULL,
    promotion_name VARCHAR(100) NOT NULL,
    promotion_description TEXT,
    discount_type VARCHAR(50),
    discount_amount DECIMAL(10, 2),
    discount_percent DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    min_quantity INT,
    max_quantity INT,
    min_purchase_amount DECIMAL(10, 2),
    promotion_channel VARCHAR(50),
    promotion_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (promotion_id, effective_date)
);

-- Create Payment Method Dimension
CREATE TABLE IF NOT EXISTS dim_payment_method (
    payment_method_key INT AUTO_INCREMENT PRIMARY KEY,
    payment_method_id VARCHAR(20) NOT NULL,
    payment_method_name VARCHAR(50) NOT NULL,
    payment_type VARCHAR(50) NOT NULL,
    payment_processor VARCHAR(50),
    payment_terms VARCHAR(50),
    payment_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (payment_method_id, effective_date)
);

-- Create Shipping Method Dimension
CREATE TABLE IF NOT EXISTS dim_shipping_method (
    shipping_method_key INT AUTO_INCREMENT PRIMARY KEY,
    shipping_method_id VARCHAR(20) NOT NULL,
    shipping_method_name VARCHAR(50) NOT NULL,
    carrier_name VARCHAR(50),
    shipping_cost DECIMAL(10, 2),
    shipping_speed VARCHAR(50),
    tracking_available BOOLEAN,
    shipping_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    source_system VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY (shipping_method_id, effective_date)
);

