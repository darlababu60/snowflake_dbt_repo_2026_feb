
SELECT 	eno,
{{count_of_emp('clerk') }} AS clerk_COUNT,
{{ count_of_emp('manager') }} AS manager_COUNT,
{{ count_of_emp('analyst') }} AS analyst_COUNT,
SUM(CASE WHEN ENO >= '1' THEN 1 ELSE 0 END)  AS t_COUNT
from {{source("kailash_sources","EMPLOYEE_BKP")}} 
{{ dbt_utils.group_by(n=1) }}
/*-- models/departwise count of employees
--group by 2  means group by second column
--group by 1
select  employee_id
from {{ source('kailash_sources', 'EMPLOYEE_BKP') }}
group by 1

*/
/*
create or replace TABLE TEST_DB.TEST_SCHEMA.EMPLOYEE_BKP (
	ENO NUMBER(38,0),ENAME VARCHAR(10),JOB VARCHAR(10),MGR NUMBER(38,0),HIREDATE DATE,
	SAL NUMBER(38,0),COMM NUMBER(38,0),DPNO NUMBER(38,0));
*/