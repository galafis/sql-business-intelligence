-- Business Intelligence Schema Creation
-- Author: Gabriel Demetrios Lafis
-- Date: 2023-06-05
-- Description: Creates the schema for the Business Intelligence database

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS business_intelligence;

-- Use the database
USE business_intelligence;

-- Create schema for dimensional model
CREATE SCHEMA IF NOT EXISTS dim_model;

-- Create schema for staging area
CREATE SCHEMA IF NOT EXISTS staging;

-- Create schema for reporting
CREATE SCHEMA IF NOT EXISTS reporting;

-- Create schema for metadata
CREATE SCHEMA IF NOT EXISTS metadata;

-- Set default schema
SET search_path TO dim_model, public;

