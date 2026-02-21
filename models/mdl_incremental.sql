{{config(materialized='incremental', unique_key='eno') }}   --created as table in test_schema
with source_data as (
select *  from {{source("kailash_sources","EMPLOYEE")}}  where hiredate >= to_date('{{ var("start_date") }}')
)
select * from source_data

{% if is_incremental() %}
where hiredate > (   select max(hiredate) from {{ this }}    )
{% endif %}


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



