/*
=============================================================
MySQL Data Warehouse Setup Script
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three
    simulated schemas representing the typical data warehouse layers: 'bronze', 'silver', and 'gold'.
    In MySQL, schemas are implemented either as separate databases or using table name prefixes.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
=============================================================
*/

-- Drop the main 'DataWarehouse' database if it exists
DROP DATABASE IF EXISTS DataWarehouse;

-- Create the main 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

-- Switch to the new database
USE DataWarehouse;

-- ==============================================================
-- Simulate Schemas / Layers in MySQL
-- Option 1: Using separate databases for bronze, silver, gold
-- ==============================================================
CREATE DATABASE IF NOT EXISTS DataWarehouse_bronze;
CREATE DATABASE IF NOT EXISTS DataWarehouse_silver;
CREATE DATABASE IF NOT EXISTS DataWarehouse_gold;

-- Option 2 (alternative): Using table prefixes in the main database
-- Example:
-- CREATE TABLE bronze_customers (
--     customer_id INT PRIMARY KEY,
--     name VARCHAR(100),
--     city VARCHAR(50)
-- );
-- CREATE TABLE silver_orders (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE,
--     amount DECIMAL(10,2)
-- );
-- CREATE TABLE gold_sales (
--     sale_id INT PRIMARY KEY,
--     product_id INT,
--     sale_date DATE,
--     total_amount DECIMAL(10,2)
-- );

-- ==============================================================
-- End of Script
-- ==============================================================
