CREATE OR REPLACE FUNCTION test_db.test_schema.fnc_only_int(a_string STRING)
returns string
language sql
as (
  REGEXP_REPLACE(phone, '[^0-9]', '')
);
{#
    create or replace function my_schema.my_udf(x number)
    returns number
    as
    $$
      x * 2
    $$;
{% macro create_clean_phone_udf() %}
    create or replace function {{ target.schema }}.clean_phone(phone string)
    returns string
    language sql
    as
    $$
        regexp_replace(phone, '[^0-9]', '')
    $$;
{% endmacro %}#}
{# output
REGEXP_REPLACE(phone, '[^0-9]', '')--'123-456-7890'
'1234567890'        '(555) 123-9999'
'5551239999'    	'123'
'###'                ''

example2::
CREATE OR REPLACE FUNCTION test_db.test_schema.fnc_positive_int(a_string STRING)
returns string
language sql
as (
  REGEXP_INSTR(a_string, r'^[0-9]+$')
);

#}