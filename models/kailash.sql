
    {{ config(materialized='incremental') }}  
select eno,ename,job,mgr,hiredate,sal,comm,dpno  from {{source("kailash_sources","EMPLOYEE")}}

{#   where order_date >= '{{ var("start_date") }}'
#}