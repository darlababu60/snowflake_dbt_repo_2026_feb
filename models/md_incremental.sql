{{config(materialized='incremental') }}     


select eno,ename
from {{source("kailash_sources","EMPLOYEE")}}

{#   where order_date >= '{{ var("start_date") }}'
#}
