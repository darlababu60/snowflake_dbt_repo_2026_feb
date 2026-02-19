{{ config(
    materialized='incremental') }} 
    select
    s.dpno,
    s.total_salary,
    s.total_salary * 0.1 as projected_growth
from {{ ref('mdl_ephemeral') }} s
order by s.total_salary desc

--{{target.schema}} =  SCH_KAILASH--?
--{{target.database}} = DB_KAILASH--?
-- ok done