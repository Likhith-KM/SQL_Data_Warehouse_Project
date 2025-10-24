/*
=============================================================
Bronze Layer - Raw Data Tables (No Constraints)(DDL)
=============================================================
Purpose:
    This script creates the raw "bronze" layer tables inside the
    DataWarehouse_bronze database. These tables are designed to 
    store data exactly as imported, without enforcing constraints 
    such as PRIMARY KEY or FOREIGN KEY.

Note:
    This layer is intended for raw ingestion only. Data will be
    cleaned, validated, and transformed later in the 'silver' and 
    'gold' layers.
=============================================================
*/

-- Switch to the bronze database
USE DataWarehouse_bronze;

-- ==============================================================
-- CRM Tables
-- ==============================================================

CREATE TABLE IF NOT EXISTS bronze_crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(20),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE
);

CREATE TABLE IF NOT EXISTS bronze_crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(30),
    prd_nm VARCHAR(100),
    prd_cost DECIMAL(10,2),
    prd_line CHAR(1),
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE TABLE IF NOT EXISTS bronze_crm_sales_details (
    sls_ord_num VARCHAR(20),
    sls_prd_key VARCHAR(30),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales DECIMAL(10,2),
    sls_quantity INT,
    sls_price DECIMAL(10,2)
);

-- ==============================================================
-- ERP Tables
-- ==============================================================

CREATE TABLE IF NOT EXISTS bronze_erp_loc_a101 (
    CID VARCHAR(20),
    CNTRY VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS bronze_erp_px_cat_g1v2 (
    ID VARCHAR(20),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS bronze_erp_cust_az12 (
    CID VARCHAR(20),
    BDATE DATE,
    GEN VARCHAR(10)
);


-- ==============================================================
-- End of Script
-- ==============================================================
