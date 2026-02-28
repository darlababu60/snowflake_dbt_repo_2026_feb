{% macro recent_records(table, date_column, days=7) %}
  select *
  from {{ table }}
  where {{ date_column }} >= current_date - interval '{{ days }} day'
{% endmacro %}