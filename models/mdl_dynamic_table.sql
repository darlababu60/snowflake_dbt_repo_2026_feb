
   --Dynamic tables cannot be downstream from: materialized views, external tables, streams.ie-Dynamic Table → View → Dynamic Table not allowed
   --Dynamic Table → Dynamic Table...is allowed....
   
    {{ config(materialized='table',
    target_lag='1 hour',
    tmp_relation_type="table | view",
    INITIALIZE = 'ON_CREATE',
    immutable_where="order_date < current_date - interval '7 day'",
    snowflake_warehouse='compute_wh',tags=["finance", "daily_refresh"],
    ) }}  
   {%- set target_relation = api.Relation.create(
               database='test_db',
               schema='test_schema',
               identifier='EMPLOYEE') -%}

select 
       eno,ename,job, mgr, hiredate,sal,comm,
       {{ mac_only_integer('hiredate') }} as new_column,-- calling macro
       --test_db.test_schema.fnc_only_integer(comm) as only_integers, --calling function but not working...because check macro
       dpno  
from {{ source("kailash_sources","EMPLOYEE") }}

{#   where order_date >= '{{ var("start_date") }}'
immutable_where='ts < CURRENT_TIMESTAMP() - INTERVAL \'10 DAY\''
#}