{%snapshot snp_chk_source%}--DB_KAILASH.SNAPSHOTSSS.ADS_SNAPSHOT_KAILASHH_CHK_SOURCE
{{ config(
      target_schema='snapshotsss',
      unique_key = 'ENO',
      strategy='check',
      check_cols=['ENAME','JOB']
    )}}
select *  from {{source("kailash_sources","EMPLOYEE_BKP")}}
--from {{ref('kailash')}} 
{% endsnapshot %}

