{{ config(materialized= 'table')}}

select employee_id , role ,start_date ,end_date 
from test_db.test_schema.employee_roles


{#
Encountered an error:
Runtime Error
  Database Error in sql_operation inline_query (from remote system.sql)
    002003 (42S02): SQL compilation error:
    Object 'TEST_DB.TEST_SCHEMA.EMPLOYEE_ROLES' does not exist or not authorized.
    #}