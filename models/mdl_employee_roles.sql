{{ config(materialized= 'table')}}

select employee_id , role ,start_date ,end_date 
from test_db.test_schema.employee_roles
