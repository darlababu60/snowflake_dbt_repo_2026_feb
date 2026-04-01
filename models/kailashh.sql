
--Query tag -->Q tags are a Snowflake parameter that can be quite useful later on when searching in the QUERY_HISTORY view.
{#incremental_strategy='insert_overwrite',
    overwrite_columns=['id', 'value', 'event_date']
    #}
-- incremental_strategy=  'insert_overwrite'  incremental_strategy='merge',append,microbatch,insert+delete, as below----->
--incremental_strategy='delete+insert',
--append	get_incremental_append_sql
--delete+insert	get_incremental_delete_insert_sql
--merge	get_incremental_merge_sql
--insert_overwrite	get_incremental_insert_overwrite_sql
--microbatch	get_incremental_microbatch_sql
--config 
--merge_update_columns = ['email', 'ip_address'],
--merge_exclude_columns = ['created_at'],
--cluster_by: ['session_start']
--imports=["@mystage/mycustompackage.zip"],  # Specify the external package location
{#data = {
        "name": ["Alice", "Bob", "Charlie"],"score": [85, 90, 88]}
    df = pd.DataFrame(data)
    # Process data with the external package
    df["adjusted_score"] = df["score"].apply(lambda x: some_external_package.adjust_score(x))
    # Return the DataFrame as the model output
    return df
    #}

    {{ config(materialized='table',target_lag='1 hour',transient=true,
    incremental_strategy='merge',partition_by={ "field": "hiredate","data_type": "date"},
    snowflake_warehouse='compute_wh',tags=["finance", "daily_refresh"],
    ) }}  
   {%- set target_relation = api.Relation.create(
      database='test_db',
      schema='test_schema',
      identifier='EMPLOYEE') -%}
select 
       eno,
       ename,
       job,
       mgr,
       hiredate,
       sal,
       comm,
       {{ mac_only_integer('hiredate') }} as new_col_only_integer,-- calling macro
       --test_db.test_schema.fnc_only_integer(comm) as only_integers, --calling function but not working...because check macro
       dpno  
from {{ source("kailash_sources","EMPLOYEE") }}

{% if is_incremental() %}
WHERE hiredate >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 DAY)
{% endif %}
{#   where order_date >= '{{ var("start_date") }}'
immutable_where='ts < CURRENT_TIMESTAMP() - INTERVAL \'10 DAY\''
#}