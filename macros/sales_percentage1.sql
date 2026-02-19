{% macro sales_percentage1(x, y) %}
    ( {{ x }}  - {{ y }} / {{ y}} ) * 100
{# code is working  #}
{% endmacro %}




