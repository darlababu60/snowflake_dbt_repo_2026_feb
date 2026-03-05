
--A macro that creates a function cannot be called inside a SELECT.
--Macros run at compile time, not at query runtime
--not able to run source
{% macro mac_only_integer(col_name) %}
    REGEXP_REPLACE({{ col_name }}, '[^0-9]', '')
{% endmacro %}





{#
{% macro mac_function1(ta) %}
CREATE OR REPLACE FUNCTION test_db.test_schema.fnc_only_integer(a_string STRING)
returns string
language sql
as (
  REGEXP_REPLACE(phone, '[^0-9]', '')
);
{% endmacro %}
#}