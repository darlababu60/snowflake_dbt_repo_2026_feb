-- models/daily_sales_report.sql
{{ config(materialized='table') }}
{# 
{{ config() }} order_date 
{% set date_column = var('date_column', 'day') %} 
{% set granularity = var('granularity', 'day') %}
{% set date_column = var('date_column', 'order_date') %}--invalid order_date so
{% set date_column = date_column | default('day') %} 
{% set granularity = granularity | default('day') %}    
#} 

{% set date_column = var('date_column', 'hiredate') %}
{% set granularity = var('granularity', 'day') %}

SELECT
  DATE_TRUNC('{{ granularity }}', {{ date_column }}) as period,
  SUM(sal) as sales
FROM {{ ref('kamaleshwar') }}
GROUP BY 1
ORDER BY 1


