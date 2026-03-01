--mdl_sample2.sql
with months as (

    {{ dbt_utils.date_spine(
        datepart="month", 
        start_date="cast('2024-01-01' as date)",
        end_date="cast('2024-12-01' as date)"
    ) }}
{#   datepart="month",---options day month year #}
)
select
    m.date_month,
    coalesce(sum(f.revenue), 0) as revenue
from months m
left join fact_sales f
    on date_trunc('month', f.order_date) = m.date_month
group by 1