// Create warehouse for ELT DEV
create or replace warehouse FT_WH_ELT_DEV with
    WAREHOUSE_SIZE = MEDIUM
    MAX_CLUSTER_COUNT = 4
    MIN_CLUSTER_COUNT = 1
    SCALING_POLICY = STANDARD
    AUTO_SUSPEND = 1
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Medium warehouse for ELT DEV';

// Create warehouse for ELT QA
create or replace warehouse FT_WH_ELT_QA with
    WAREHOUSE_SIZE = MEDIUM
    MAX_CLUSTER_COUNT = 4
    MIN_CLUSTER_COUNT = 1
    SCALING_POLICY = STANDARD
    AUTO_SUSPEND = 1
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Medium warehouse for ELT QA';

// Create warehouse for ELT PROD
create or replace warehouse FT_WH_ELT_PROD with
    WAREHOUSE_SIZE = MEDIUM
    MAX_CLUSTER_COUNT = 4
    MIN_CLUSTER_COUNT = 1
    SCALING_POLICY = STANDARD
    AUTO_SUSPEND = 1
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Medium warehouse for ELT PROD';

show warehouses;
