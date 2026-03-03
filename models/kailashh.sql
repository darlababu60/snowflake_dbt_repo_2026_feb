
    {{ config(materialized='table',
              target_lag='1 hour',
              snowflake_warehouse='compute_wh',
              immutable_where='ts < CURRENT_TIMESTAMP() - INTERVAL \'1 DAY\'') }}  
select eno,
       ename,
       job,
       mgr,
       hiredate,
       sal,
       comm,
       dpno  
       from {{source("kailash_sources","EMPLOYEE")}}

{#   where order_date >= '{{ var("start_date") }}'
#}