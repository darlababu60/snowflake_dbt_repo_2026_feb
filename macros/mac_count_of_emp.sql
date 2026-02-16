
{% macro count_of_emp(xyz) %}
    SUM(CASE WHEN job = '{{xyz}}' THEN 1 ELSE 0 END)
{% endmacro %}
--SUM(CASE WHEN job = 'salesmen' THEN 1 ELSE 0 END)  AS salesmen_COUNT