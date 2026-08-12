{% macro mac_recent_records(table, date_column, days=7) %}
  select *
  from {{ table }}
  where {{ date_column }} >= current_date - interval '{{ days }} day'
{% endmacro %}

{#
select *
from TEST_DB.TEST_SCHEMA.EMPLOYEE
where HIREDATE >= current_date - INTERVAL '4000000 day'
where HIREDATE >=current_date - INTERVAL '{{ days }} day'
where HIREDATE >= CURRENT_DATE - INTERVAL '1 year'
where HIREDATE >= CURRENT_DATE - INTERVAL '6 month'
where HIREDATE >= CURRENT_DATE - INTERVAL '40 day'
WHERE HIREDATE >= DATEADD(year, -1, CURRENT_DATE);
WHERE HIREDATE >= CURRENT_DATE - INTERVAL '2 years 3 months 15 days';
WHERE HIREDATE >= CURRENT_DATE - INTERVAL '1 year 6 months';

#}