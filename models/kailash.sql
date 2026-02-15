
{{ config(
    materialized='incremental') }}      
      
      
select * from {{source("kailash_sources","EMPLOYEE")}}
{#
where order_date >= '{{ var("start_date") }}'
#}