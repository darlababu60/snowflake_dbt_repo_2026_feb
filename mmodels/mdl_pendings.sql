{{ config(
    materialized='incremental') }}   

    
with kailash as (
    select eno,ename
    from {{source("kailash sources","EMPLOYEE")}}
    group by eno,ename
    )

select * from kailash

/*--select * from {{source("kailash sources","EMPLOYEE")}}

--{% if adapter.already_exists(this.schema, this.name) %}
--where id > (select max(id) from {{this}})
--{% endif %}



*/

