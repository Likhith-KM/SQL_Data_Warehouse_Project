/*
===============================================================================
DDL Script: Create Silver Tables (comments simplified)
===============================================================================
Purpose:
    Creates the tables inside the 'silver' schema. If a table already exists,
    it will be dropped first and then re-created. This re-defines the table
    structure (DDL) for the Silver layer only — it does not preserve or
    migrate existing table data.

Notes:
  - Target schema: silver
  - Each table has a dwh_create_date column defaulting to the current date/time
  - This script drops tables only when they exist, then creates them fresh
===============================================================================
*/
use DataWarehouse

GO

    -- Drop crm_cust_info if it exists (customer information table)
    IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
        DROP TABLE silver.crm_cust_info;
    GO
    
    -- Create customer information table in silver schema
    CREATE TABLE silver.crm_cust_info (
        cst_id             INT,
        cst_key            NVARCHAR(50),
        cst_firstname      NVARCHAR(50),
        cst_lastname       NVARCHAR(50),
        cst_marital_status NVARCHAR(50),
        cst_gndr           NVARCHAR(50),
        cst_create_date    DATE,
        dwh_create_date    DATETIME2 DEFAULT GETDATE()
    );
    GO
    
    -- Drop crm_prd_info if it exists (product information table)
    IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
        DROP TABLE silver.crm_prd_info;
    GO
    
    -- Create product information table in silver schema
    CREATE TABLE silver.crm_prd_info (
        prd_id          INT,
        cat_id          NVARCHAR(50),
        prd_key         NVARCHAR(50),
        prd_nm          NVARCHAR(50),
        prd_cost        INT,
        prd_line        NVARCHAR(50),
        prd_start_dt    DATE,
        prd_end_dt      DATE,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
    GO
    
    -- Drop crm_sales_details if it exists (sales transactions table)
    IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
        DROP TABLE silver.crm_sales_details;
    GO
    
    -- Create sales transactions table in silver schema
    CREATE TABLE silver.crm_sales_details (
        sls_ord_num     NVARCHAR(50),
        sls_prd_key     NVARCHAR(50),
        sls_cust_id     INT,
        sls_order_dt    DATE,
        sls_ship_dt     DATE,
        sls_due_dt      DATE,
        sls_sales       INT,
        sls_quantity    INT,
        sls_price       INT,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
    GO
    
    -- Drop erp_loc_a101 if it exists (ERP location reference table)
    IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
        DROP TABLE silver.erp_loc_a101;
    GO
    
    -- Create ERP location reference table in silver schema
    CREATE TABLE silver.erp_loc_a101 (
        cid             NVARCHAR(50),
        cntry           NVARCHAR(50),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
    GO
    
    -- Drop erp_cust_az12 if it exists (ERP customer table)
    IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
        DROP TABLE silver.erp_cust_az12;
    GO
    
    -- Create ERP customer table in silver schema
    CREATE TABLE silver.erp_cust_az12 (
        cid             NVARCHAR(50),
        bdate           DATE,
        gen             NVARCHAR(50),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
    GO
    
    -- Drop erp_px_cat_g1v2 if it exists (ERP product category table)
    IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
        DROP TABLE silver.erp_px_cat_g1v2;
    GO
    
    -- Create ERP product category table in silver schema
    CREATE TABLE silver.erp_px_cat_g1v2 (
        id              NVARCHAR(50),
        cat             NVARCHAR(50),
        subcat          NVARCHAR(50),
        maintenance     NVARCHAR(50),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
    GO
    
