{{ config(materialized='table') }}
{% set tmp_relation_type = 'table' %}
select * from TEST_DB.test_schemA.EMPLOYEE
-- ok done







