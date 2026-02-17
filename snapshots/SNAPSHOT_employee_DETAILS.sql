{%snapshot SNP_EMPLOYEE %}
{{ config(
      target_schema='snapshots',
      unique_key = 'ENO',
      strategy='check',
      check_cols=['ENAME','JOB']
    )}}
select * from {{source("kailash_sources","EMPLOYEE_BKP")}} 
{% endsnapshot %}
--c.eno,c.ename,c.job,c.sal
--from {{ref('kailash')}} c
--snapshot will be created only once,...untill u change th code it will not cretae new one

/*
03:32:11
Warning: the project's environment for defer does not exist, does not have a successful run, or you don't have permission. Please ensure that the environment exists and has a successful run. Disabling auto-deferral.
03:32:11
Cloud CLI invocation created: 66ed22e9-5078-4a30-ade6-b1b772d25a1f
03:32:11
Running dbt...
03:32:12
[WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- data_tests.project_dev
03:32:12
Found 26 models, 5 snapshots, 6 data tests, 5 seeds, 10 sources, 934 macros
03:32:12
The selection criterion 'SNAPSHOT_employee_details' does not match any enabled nodes
03:32:12
Nothing to do. Try checking your model configs and model specification args
