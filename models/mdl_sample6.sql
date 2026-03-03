-- models/daily_sales_report.sql
{{ config(materialized='table') }}

{# {{ config() }} #}
{% set date_column = var('date_column', 'order_date') %}
{% set granularity = var('granularity', 'day') %}

SELECT
  DATE_TRUNC('{{ granularity }}', {{ date_column }}) as period,
  SUM(amount) as sales
FROM {{ ref('kamaleshwar') }}
GROUP BY 1
ORDER BY 1


