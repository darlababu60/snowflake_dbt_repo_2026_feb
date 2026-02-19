{{ config(materialized='table') }}
--{{ config(tags=['orders_related']) }}
select ENO,
max(sal) as max_sal,avg(sal) as avg_sal,count(ENO) count
from {{source("kailash_sources","EMPLOYEE")}}
--from {{ ref ('kailash') }} 
{{ dbt_utils.group_by(n=1) }}
