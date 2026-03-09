{{ config(materialized='incremental',
        ) }} 
--no config so it is created as view -md_persons_sample in database. test_db,test_schema
select
	cast(ENO as string) as emp_no,
	--order_id, this row is commented out
    cast(ename as string) as emp_name
from {{ ref ('kailashh') }} 

{% if is_incremental() %}
        where HIREDATE >= dateadd(day, -3, current_date)
    {% endif %}

    
--******** ref will not reffer model available like kailash...it will refer only database table,view,ephemeral only
--*******model level confi file is higest priority
--ok done
--merge_update_columns = ['email', 'ip_address'],...how working
--merge_exclude_columns = ['email', 'ip_address'],...,...how working
--incremental_predicates: ["DBT_INTERNAL_DEST.session_start > dateadd(day, -7, current_date)"]....how working?

{#
merge_update_columns = ['email', 'ip_address'], incremental_predicates: ["DBT_INTERNAL_DEST.session_start > dateadd(day, -7, current_date)"]
        merge_exclude_columns = ['email', 'ip_address'],
        #}