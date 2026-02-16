{{config(materialized='ephemeral')}}
select * from {{source("kailash_sources","EMPLOYEE")}}

--hi -- hello--ephemeral means temporary existance.