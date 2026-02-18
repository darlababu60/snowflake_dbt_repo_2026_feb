--dbt_utils?
-- dbt_utils.deduplicate()
--where updated_at > (select max(updated_at) from {{ this }})

{{ config(materialized='incremental', unique_key='eno') }}
with x as (
          {{ dbt_utils.deduplicate(relation = ref("kailash"), partition_by = 'dpno', order_by = 'sal ', ) }} --defult sal asc
          --dpno not case sensitive
          )
select * from x

/*
or
--relation= source ('xyz','kailash') or  --relation= source("kailash sources","EMPLOYEE"), or --ref("kailash")
{{ config(materialized='incremental', unique_key='ENO') }}
{{   dbt_utils.deduplicate( relation = ref("kailash"), partition_by = 'dpno', order_by = 'sal desc', ) }}
--relation=ref("employee"),---not working
--relation=ref("kailash"),--- working
--relation=ref("mdl_naresh"),--- working
--relation= source("kailash sources","EMPLOYEE"),--- working


sample data employee
7521	ward	salesmen	7698	0081-02-22	1250	500	30
7566	jones	manager	7839	0081-04-02	2975		20
7654	martin	salesmen	7698	0081-09-28	1250	1400	30
7698	blake	manager	7839	0081-05-01	2850		30
7782	clark	manager	7839	0081-06-09	2450		10
7788	scott	analyst	7566	0082-12-09	3000		20
7839	king	president		0081-11-17	5000		10
7844	turner	salesmen	7698	0081-09-08	1500	0	30
7876	adams	clerk	7788	0003-01-12	1100		20
7900	james	clerk	7698	0081-12-03	950		30
7902	ford	analyst	7566	0081-12-03	3000		20
7934	miller	clerk	7782	2026-01-23	1300		10
incremental-{{ dbt_utils.deduplicate(relation = ref("kailash"), partition_by = 'dpno', order_by = 'sal ', ) }}--default asc 100,200,300...
output:::::::::::::::::::
7788	scott	analyst	7566	0082-12-09	3000		20
7839	king	president		0081-11-17	5000		10
7698	blake	manager	7839	0081-05-01	2850		30
group 10
7839	king	president		0081-11-17	5000		10-->
7782	clark	manager	7839	0081-06-09	2450		10
7934	miller	clerk	7782	2026-01-23	1300		10-->
group 20
7788	scott	analyst	7566	0082-12-09	3000		20-->
7902	ford	analyst	7566	0081-12-03	3000		20
7566	jones	manager	7839	0081-04-02	2975		20
7369	smith	clerk	7902	0080-12-17	2000	1111	20
7876	adams	clerk	7788	0003-01-12	1100		20-->
group 30
7698	blake	manager	7839	0081-05-01	    2850    	    30-->
7499	allen	salesmen	7698	0081-02-20	1600	  300	30
7844	turner	salesmen	7698	0081-09-08	1500	   0	30
7521	ward	salesmen	7698	0081-02-22	1250	 500	30
7654	martin	salesmen	7698	0081-09-28	1250	1400	30
7900	james	clerk	7698	    0081-12-03	  950          30--->
incremental-{{ dbt_utils.deduplicate(relation = ref("kailash"), partition_by = 'dpno', order_by = 'sal desc', ) }} --300,200,100.....
output::::::::::::::::::::
7900	james	clerk	7698	0081-12-03	950		30
7876	adams	clerk	7788	0003-01-12	1100		20
7934	miller	clerk	7782	0082-01-23	1300		10
*/


