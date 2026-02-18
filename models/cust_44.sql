{{config(materialized='ephemeral')}}
-- ephemral wont have logs and pysical in database..only cte in dbt trget location..
select * from {{source("kailash_sources","EMPLOYEE_BKP")}}

--hi -- hello--ephemeral means temporary existance.