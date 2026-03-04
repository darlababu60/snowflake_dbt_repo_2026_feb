--mdl_sample 
----column order_date not available so dbt run -s mdl_sample----> fails
SELECT
  date_trunc('month', HIREDATE) as month,-- to the first day of month--> 2024-03-01 00:00:00
  SUM(amount) as monthly_sales
FROM {{ ref('kamaleshwar') }}
WHERE 
  order_date >= '{{ var("start_date") }}'
  AND order_date <= '{{ var("end_date") }}'
  AND  status = '{{ var("user_status", "active") }}'
  {% if var('row_limit') %}
  LIMIT {{ var('row_limit') }}
  {% endif %}
  -- dbt test -m mdl_sample-------------------wkd
  --dbt run --vars '{"start_date": "2023-01-01", "end_date": "2023-03-31"}'
  --dbt run --vars '{"regions": ["north", "south"], "include_test_data": false}'
  --env vrbles
  -- Configuring a model to use environment variables
{#
{{ config(schema=env_var('DBT_SCHEMA', 'analytics')) }}

SELECT * FROM {{ ref('stg_orders') }}
#}