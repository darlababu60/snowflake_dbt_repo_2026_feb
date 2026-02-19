{{config(materialized='ephemeral')}}
-- ephemral wont have logs and pysical in database..only cte in dbt trget location..

select dpno,
       sum(sal) as total_salary
from {{ source("kailash_sources", "EMPLOYEE") }}
group by dpno having total_salary > 1000

-- this ephemeral model refferences mdl_naresh
--hi -- hello--ephemeral means temporary existance.
-- single line commenting.
/* for multi line sql syntax comemnt ing */
{# for jinja lines commenting #}