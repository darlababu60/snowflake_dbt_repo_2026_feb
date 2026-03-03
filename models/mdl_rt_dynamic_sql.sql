{{ config(materialized='table') }} 

{{ mac_dynamic_pivot(
    'sales_data',
    ['order_date', 'region'],
    'product_category',
    'sales_amount'
) }}