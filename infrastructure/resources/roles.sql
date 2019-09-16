----------------------------------
-- Switch to securityadmin role --
----------------------------------
use role securityadmin;

----------------------
-- Assign variables --
----------------------

set v_client_prefix =         'ft_';
set v_environment =           'dev'; --dev, qa, prod
set v_elt_schema =            'transform_stage'; --raw_stage, transform_stage, raw_ingester, ps_xre
set v_reporting_schema =      'data_warehouse'; -- ssc_business, ssc_summary

set v_read_only_role  =       (select $v_environment || '_elt_read_only');
set v_read_write_role =       (select $v_environment || '_elt_read_write');
set v_report_read_only =      (select $v_environment || '_report_read_only');

set v_elt_svc_user =          (select $v_client_prefix || 'elt_svc_usr_' || $v_environment);
set v_database =              (select $v_client_prefix || 'db_' || $v_environment);
set v_warehouse =             (select $v_client_prefix || 'wh_elt_' || $v_environment);
set v_full_elt_path =         (select $v_database || '.' || $v_elt_schema);
set v_full_reporting_path =   (select $v_database || '.' || $v_reporting_schema);

------------------
-- Set comments --
------------------
set v_read_only_role_comment =          (select 'This role has read only privileges on all schemas in ' || $v_database);
set v_read_write_role_comment =         (select 'This role has read/write privileges on all schemas in ' || $v_database);
set v_report_read_only_comment =        (select 'This role has read only privileges on reporting schemas in ' || $v_database);

-----------
-- check --
-----------
show variables;

----------------------------------
-- Switch to sysadmin role --
----------------------------------
use role sysadmin;

---------------------
-- Create database --
---------------------
create database if not exists identifier($v_database);

---------------------
-- Create schema --
---------------------
use database identifier($v_database);
create transient schema if not exists identifier($v_elt_schema);

----------------------------------
-- Switch to securityadmin role --
----------------------------------
use role securityadmin;

------------------
-- Create roles --
------------------
create role if not exists identifier($v_read_only_role)
  comment = $v_read_only_role_comment;

create role if not exists identifier($v_read_write_role)
  comment = $v_read_write_role_comment;

create role if not exists identifier($v_report_read_only)
  comment = $v_report_read_only_comment;

-----------------------------
-- Grant roles to sysadmin --
-----------------------------
grant role identifier($v_read_only_role)
  to role sysadmin;

grant role identifier($v_read_write_role)
  to role sysadmin;

grant role identifier($v_report_read_only)
  to role sysadmin;

--------------------------
-- Grant roles to users --
--------------------------
grant role identifier($v_read_write_role)
  to user identifier($v_elt_svc_user);

-----------------------
-- Grant usage on db --
-----------------------
grant usage
  on database identifier($v_database)
  to role identifier($v_read_only_role);

grant usage
  on database identifier($v_database)
  to role identifier($v_read_write_role);

grant usage
  on database identifier($v_database)
  to role identifier($v_report_read_only);

-----------------------
-- Grant permissions --
-----------------------
-- read_only_roles
grant usage
  on schema identifier($v_full_elt_path)
  to role identifier($v_read_only_role);

grant select
  on future tables in schema identifier($v_full_elt_path)
  to role identifier($v_read_only_role);

grant usage
  on warehouse identifier($v_warehouse)
  to role identifier($v_read_only_role);

-- read_write_role
grant usage
  on all schemas in database identifier($v_database)
  to role identifier($v_read_only_role);

grant select
  on all tables in schema identifier($v_full_elt_path)
  to role identifier($v_read_only_role);

grant all
  on schema identifier($v_full_elt_path)
  to role identifier($v_read_write_role);

grant all
  on all tables in schema identifier($v_full_elt_path)
  to role identifier($v_read_write_role);

grant all
  on future tables in schema identifier($v_full_elt_path)
  to role identifier($v_read_write_role);

grant all
  on future tables in schema identifier($v_full_elt_path)
  to role identifier($v_read_write_role);

grant usage
  on warehouse identifier($v_warehouse)
  to role identifier($v_read_write_role);

-- report_read_only_role
grant usage
  on schema identifier($v_full_reporting_path)
  to role identifier($v_report_read_only);

grant select
  on all tables in schema identifier($v_full_reporting_path)
  to role identifier($v_report_read_only);

grant select
  on future tables in schema identifier($v_full_reporting_path)
  to role identifier($v_report_read_only);

grant usage
  on warehouse identifier($v_warehouse)
  to role identifier($v_report_read_only);

-- check
show roles;

show users like 'ft%';
