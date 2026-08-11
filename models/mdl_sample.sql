--mdl_sample 
----column order_date not available so dbt run -s mdl_sample----> fails
SELECT
  date_trunc('month', HIREDATE) as month,-- to the first day of month--> 2024-03-01 00:00:00
  SUM(sal) as monthly_sales
FROM {{ ref('kamaleshwar') }}
WHERE 
  HIREDATE >= '{{ var("start_date") }}'
  AND HIREDATE <= '{{ var("end_date") }}'
  AND  ENAME = '{{ var("user_status", "active") }}'
  GROUP BY 1
{% if var('row_limit', none) %}
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
-- [KAMALESHWAR.HIREDATE] is not a valid group by expression--so group by 1
{#
SELECT
  date_trunc('month', HIREDATE) as month,-- to the first day of month--> 2024-03-01 00:00:00
  SUM(sal) as monthly_sales
FROM test_db.TEST_SCHEMA.kamaleshwar
WHERE 
  HIREDATE >= '0079-12-21'
  AND HIREDATE <= '2022-12-31'
  AND  ENAME = 'active'
  GROUP BY 1
  #} 