{% macro generate_date_dimension(start_date, end_date) %}

    WITH date_spine AS (
        {{ dbt_utils.date_spine(
            datepart="day",
            start_date="cast('" ~ start_date ~ "' as date)",
            end_date="cast('" ~ end_date ~ "' as date)"
        ) }}
    ),
    dates AS (SELECT
            cast(date_day as date) as date_day,
            extract(year from date_day) as year,extract(month from date_day) as month,
            extract(day from date_day) as day_of_month,extract(dayofweek from date_day) as day_of_week,
            extract(quarter from date_day) as quarter
        FROM date_spine
    )
    SELECT * FROM dates
{% endmacro %}