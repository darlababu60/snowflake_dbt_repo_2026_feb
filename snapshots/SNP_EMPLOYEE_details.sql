{%snapshot SNP_EMPLOYEE_details %}
--{% set new_schema = target.schema +'_NEW_KAILASH' %}

{{ config(
      target_schema= new_schema,
      target_database='TEST_DB',
      unique_key = 'ENO',
      strategy='check',
      check_cols=['ENAME','JOB']
    )}}

select c.eno,c.ename,c.job,c.sal from {{source("kailash_sources","EMPLOYEE_BKP")}} 
{% endsnapshot %}
--from {{ref('kailash')}} c
--snapshot will be created only once,...untill u change th code it will not cretae new one