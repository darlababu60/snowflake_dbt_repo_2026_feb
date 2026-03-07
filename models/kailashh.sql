
--Query tag -->Q tags are a Snowflake parameter that can be quite useful later on when searching in the QUERY_HISTORY view.


    {{ config(materialized='table',target_lag='1 hour',transient=true,query_tag = 'dbt_special',
    incremental_strategy='merge',
              snowflake_warehouse='compute_wh',tags=["finance", "daily_refresh"],
              
              ) }}  
   {%- set target_relation = api.Relation.create(
      database='test_db',
      schema='test_schema',
      identifier='EMPLOYEE') -%}

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