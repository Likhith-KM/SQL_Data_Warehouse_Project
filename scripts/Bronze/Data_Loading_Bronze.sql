/*
=============================================================
Data Import into Bronze Layer Tables (Source -> Bronze)
=============================================================
Script Purpose:
    This section explains two standard methods to import CSV data 
    into the Bronze Layer tables within the 'DataWarehouse_bronze' database.
    The Bronze layer holds raw data imported directly from source systems.

    Method 1 uses the MySQL Workbench GUI (Import Wizard) — 
    best suited when working with limited datasets, 
    but can also efficiently handle larger imports 
    if the table structure is properly defined.

    Method 2 uses the SQL 'LOAD DATA INFILE' command — 
    recommended for automation or large-scale data loading.

-------------------------------------------------------------
WARNING:
    Ensure that the column structure in the CSV files matches the table schema.
    For 'LOAD DATA INFILE', verify that the MySQL user has appropriate file 
    access permissions and that the 'secure_file_priv' variable allows the path used.
=============================================================
*/

/* =============================================================
Method 1: Import Using MySQL Workbench (GUI)
=============================================================
Steps:
    1. Open MySQL Workbench and connect to the server.
    2. Expand the 'DataWarehouse_bronze' database in the Navigator panel.
    3. Right-click the target table (e.g., 'bronze_crm_cust_info').
    4. Select "Table Data Import Wizard".
    5. Browse to the corresponding CSV file (e.g., 'cust_info.csv').
    6. Click "Next" to review field mappings and import settings.
    7. Click "Next" again, then "Finish" to execute the import.
    8. Once complete, verify data:
            SELECT * FROM bronze_crm_cust_info LIMIT 10;

Note:
    This method automatically handles most permissions and formatting issues.
    In this project, we use **Method 1 (MySQL Workbench Import Wizard)** 
    to import the CSV data into the Bronze Layer tables.
============================================================= */
