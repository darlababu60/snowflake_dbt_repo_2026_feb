{{ config( materialized='table',
    pre_hook="grant select on {{ this }} to role ACCOUNTADMIN",
    post_hook="grant select on {{ this }} to role ACCOUNTADMIN"
) }}

SELECT
    order_id,
    customer_id,
    amount,
    status,
    updated_at
FROM {{ ref('raw_orders') }}