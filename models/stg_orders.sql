{{ config(materialized='table') }} 

SELECT
    order_id,
    customer_id,
    amount,
    status,
    updated_at
FROM {{ ref('raw_orders') }}