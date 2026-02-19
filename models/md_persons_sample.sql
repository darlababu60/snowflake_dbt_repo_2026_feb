{{ config(materialized='table') }} 
--no config so it is created as view -md_persons_sample in database. test_db,test_schema
select
	cast(ENO as string) as emp_no,
	--order_id, this row is commented out
    cast(ename as string) as emp_name
from {{ ref ('kailash') }} 
--******** ref will not reffer model available like kailash...it will refer only database table,view,ephemeral only
--*******model level confi file is higest priority
--ok done