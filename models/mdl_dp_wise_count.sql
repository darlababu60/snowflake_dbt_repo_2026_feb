/*-- models/departwise count of employees
--*SELECT 	EMPLOYEE_ID
--{{ count_of_emp('clerk') }} AS clerk_COUNT,--{{ count_of_emp('salesmen') }} AS salesmen_COUNT,
--{{ count_of_emp('manager') }} AS manager_COUNT,--{{ count_of_emp('president') }} AS president_COUNT,
--{{ count_of_emp('analyst') }} AS analyst_COUNT
--SUM(CASE WHEN EMPLOYEE_ID >= '1' THEN 1 ELSE 0 END)  AS t_COUNT
--FROM employee
--*from {{source("kailash_sources","EMPLOYEE")}} 
--from DB_KAILASH.SCH_KAILASH.EMPLOYEE
--from {{ ref ('kailash') }} -->DB_KAILASH.DB_KAILASH.KAILASH
--*GROUP BY 1 
--{{ dbt_utils.group_by(n=1) }}
--group by 2  means group by second column
--group by 1
*/
select
    employee_id
from {{ source('kailash_sources', 'EMPLOYEE') }}
group by 1