-- models/mdl_sample5.sql
--{{ config(materialized='table') }}
{{ 
  config(
    schema=var('schema_prefix', 'dev_') ~ 'marketing'
  ) 
}}

SELECT * FROM {{ ref('kamaleshwar') }}
{% if var('row_limit') %}
LIMIT {{ var('row_limit') }}
{% endif %}