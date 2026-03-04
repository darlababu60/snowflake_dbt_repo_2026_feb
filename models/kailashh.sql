
    {{ config(materialized='table',target_lag='1 hour',
              snowflake_warehouse='compute_wh',tags=["finance", "daily_refresh"],
              
              ) }}  

select 
       eno,
       ename,
       job,
       mgr,
       hiredate,
       sal,
       comm,
       {{ mac_only_integer('hiredate') }} as new_col_only_integer,-- calling macro
       --test_db.test_schema.fnc_only_integer(comm) as only_integers, --calling function but not working...because check macro
       dpno  
from {{ source("kailash_sources","EMPLOYEE") }}

{#   where order_date >= '{{ var("start_date") }}'
immutable_where='ts < CURRENT_TIMESTAMP() - INTERVAL \'10 DAY\''
#}