{{config(materialized='incremental') }}     --created as table in test_schema

select *  from {{source("kailash_sources","EMPLOYEE")}}

where hiredate >= {{ var("start_date") }}

/*
{% if is_incremental() %}
  where updated_at > (select max(updated_at) from {{ this }})
{% endif %}
*/
