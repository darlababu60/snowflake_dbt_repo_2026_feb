{{ config(materialized='table') }}
--{{ config(tags=['orders_related']) }}
select EMPLOYEE_ID ,
max(salary) as max_sal,avg(salary) as avg_sal,count(EMPLOYEE_ID) count
from {{source("kailash_sources","EMPLOYEE")}}
--from {{ ref ('kailash') }} 
{{ dbt_utils.group_by(n=1) }}
