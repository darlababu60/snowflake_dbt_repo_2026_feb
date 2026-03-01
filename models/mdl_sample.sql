--mdl_sample 
-- --column order_date not available so dbt run -s mdl_sample----> fails
SELECT
  date_trunc('month', order_date) as month,
  SUM(amount) as monthly_sales
FROM {{ ref('stg_orders') }}
WHERE 
  order_date >= '{{ var("start_date") }}'
  AND order_date <= '{{ var("end_date") }}'
  AND  status = '{{ var("user_status", "active") }}'
  {% if var('row_limit') %}
  LIMIT {{ var('row_limit') }}
  {% endif %}
  -- dbt test -m mdl_sample-------------------wkd