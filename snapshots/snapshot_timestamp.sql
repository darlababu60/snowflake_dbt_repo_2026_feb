{% snapshot snp_timestamp %}
    {{ config(
          target_schema='test_schema',
          strategy='timestamp',
          unique_key='eno',
          updated_at='hiredate',
          invalidate_hard_deletes=True,
        )}}
select * from {{source("kailash_sources","EMPLOYEE_BKP")}}
{% endsnapshot %}
--need to check above snapshot config .....but source is fine
--transient table created with name snp_timestamp in schema -snapshots
--columns added  --DBT_SCD_ID, DBT_UPDATED_AT, DBT_VALID_FROM, DBT_VALID_TO in snowflke test_schema transient table
--sample data
--7369	smith	clerk	7902	0080-12-17	2000	1111	20	b87d90c06edc4f4b4096f1b8367fe9a3	0080-12-17	0080-12-17	

