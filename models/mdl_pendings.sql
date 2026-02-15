{{ config(
    materialized='incremental') }}   

with kailash as (
    select EMPLOYEE_ID,name
    from {{source("kailash_sources","EMPLOYEE")}}
    group by EMPLOYEE_ID,name
    )

select * from kailash

/*--select * from {{source("kailash_sources","EMPLOYEE")}}

--{% if adapter.already_exists(this.schema, this.name) %}
--where id > (select max(id) from {{this}})
--{% endif %}



*/

