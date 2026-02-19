{% snapshot snp_TIMESTAMP %}----ok running
{{ config(
          target_schema='TEST_SCHEMA',
          strategy='timestamp',
          unique_key='eno',
          updated_at='hiredate'   
        )}}
select * from {{source("kailash_sources","EMPLOYEE_BKP")}}
{% endsnapshot %}
--***if name changed it is creating new transient table in snowflke schema...so be carefull
--mistake in 1 snapshot will affeck all snapshots
--while running snapshot name is case sensitive...so  u can run with same name else it will run..but not creates table.
--transient table created with name snp_timestamp in schema -snapshots --test_schema
--columns added  --DBT_SCD_ID, DBT_UPDATED_AT, DBT_VALID_FROM, DBT_VALID_TO in snowflke test_schema transient table
--sample data
--7369	smith	clerk	7902	0080-12-17	2000	1111	20	b87d90c06edc4f4b4096f1b8367fe9a3	0080-12-17	0080-12-17	
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

