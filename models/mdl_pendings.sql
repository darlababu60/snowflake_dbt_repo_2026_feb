{{ config(
    materialized='incremental') }}   

with xuv as (
    select ENO,ename from {{source("kailash_sources","EMPLOYEE")}}  group by ENO,ename
            )
select * from xuv

/*--select * from {{source("kailash_sources","EMPLOYEE")}}
--{% if adapter.already_exists(this.schema, this.name) %}
--where id > (select max(id) from {{this}})
--{% endif %}
*/
-- ok done

