{{config(materialized='incremental') }}     --created as table in test_schema

select *  from {{source("kailash_sources","EMPLOYEE")}}  where hiredate >= to_date('{{ var("start_date") }}')
--not accepted --where hiredate >= {{ var("start_date") }}-to_date("{{ var("start_date") }}")--no
--where hiredate >= '{{ var("start_date") }}'-not accepting
--where hiredate >= to_date('{{ var("start_date") }}')--accepting 
--where hiredate >= to_date("{{ var('start_date') }}")--not accepting 
--where hiredate >= to_date("{{ var("start_date") }}")--not accepting 
/*
{% if is_incremental() %}
  where updated_at > (select max(updated_at) from {{ this }})
{% endif %}
*/
-- ok done