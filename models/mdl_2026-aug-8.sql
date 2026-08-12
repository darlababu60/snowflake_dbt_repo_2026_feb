{{ config(materialized='incremental', unique_key='eno') }}

WITH raw_data AS (

    SELECT *
    FROM {{ source("kailash_sources","EMPLOYEE") }}

)

{{ dbt_utils.deduplicate(
    relation = ref("kailashh"), 
    partition_by = 'dpno', 
    order_by = '1', 
) }}
--just select and preview/run it works
--ok done