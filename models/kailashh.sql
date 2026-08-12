
    {{ config(materialized='table',target_lag='1 hour',transient=true,
                          incremental_strategy='merge',partition_by={ "field": "hiredate","data_type": "date"},
                          snowflake_warehouse='compute_wh',tags=["finance", "daily_refresh"],
    ) }}  
--incremental_strategy='merge/append/delete+insert/insert_overwrite/microbatch
--adapter.get_relation, adapter.drop_relation, adapter.rename_relation
   {% set t_rel = api.Relation.create(
                              database='test_db1',
                              schema='test_schema',
                              identifier='EMPLOYEE_1'
      ) %}
--above code just reff
    {% set rel_exists = adapter.get_relation(
                     database=t_rel.database,
                     schema=t_rel.schema,
                     identifier=t_rel.identifier
      ) %}
--above code just reff
    select 
       eno,
       ename,
       job,
       mgr,
       hiredate,
       sal,
       comm,
       {{ mac_only_integer('hiredate') }} as new_col_only_integer,    --- calling macro
       --test_db.test_schema.fnc_only_integer(comm) as only_integers, ---calling function but not working...because check macro
       dpno  
from {{ source("kailash_sources","EMPLOYEE") }}

{% if is_incremental() %}
WHERE hiredate >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 DAY)
{% endif %}

{#   where order_date >= '{{ var("start_date") }}'
immutable_where='ts < CURRENT_TIMESTAMP() - INTERVAL \'10 DAY\''
#}

{#
1.{{ }}---for expression,for calling macros
2.{% %} for jinja statements (like loops, etc.)
3.{%-  -%} - to avoid spaces,The - removes extra whitespace/newlines.
4. {#   - for commenting the lines
5. {#   for comments (even multiline) inside the template.

{% if relation %}
    {{ log("Table exists", info=True) }}
{% else %}
    {{ log("Table does not exist", info=True) }}
{% endif %}
#}
-- it worked. ok brabch 1
