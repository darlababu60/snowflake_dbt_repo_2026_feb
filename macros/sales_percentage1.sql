{% macro sales_percentage1(col1, col2) %}
    (
        ( {{ col1 }} - {{ col2 }} )
        / nullif({{ col2 }}, 0)
    ) * 100
{% endmacro %}


