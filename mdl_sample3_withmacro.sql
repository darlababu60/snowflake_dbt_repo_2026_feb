  mdl_sampe3_withmacro.sql
  -- models/dim_date.sql
{{
    config( materialized='table')
}}

{{ generate_date_dimension('2025-12-01', '2025-12-05') }}


real.sql
{{ config(materialized='incremental') }} 

    with deduped_customers as (
    select *
    from (
        select *,
               row_number() over (partition by customer_id order by updated_at desc) as rn
        from customers
    )
    where rn = 1
)

select *
from orders o
left join deduped_customers c
  on o.customer_id = c.customer_id