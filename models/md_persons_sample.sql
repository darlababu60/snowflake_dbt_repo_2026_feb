
--no config so it is created as view in database. test_db,test_schema
select
	cast(EMPLOYEE_ID as string) as emp_no,
	--order_id, this row is commented out
    cast(name as string) as emp_name
from {{ ref ('kailash') }} 
