{{ config( materialized='table', tags=['kail'],
pre_hook="
        INSERT INTO audit_log
        (model_name, run_id, status, log_time)
        VALUES ('{{ this.name }}','{{ invocation_id }}','STARTED', CURRENT_TIMESTAMP)",
post_hook="
        INSERT INTO audit_log
        (model_name, run_id, status, log_time)
        VALUES ('{{ this.name }}','{{ invocation_id }}','STARTED',CURRENT_TIMESTAMP)"
) 
INSERT INTO audit_log
SELECT
    '{{ this.name }}','{{ invocation_id }}','ROW_COUNT',COUNT(*),CURRENT_TIMESTAMP
FROM {{ this }}
}}
-- dbt run -s tag:kail..this will run
--dbt run -s tag : kail..this will not run
{# This is a comment about hooks #}
{# no comment inside jinja syntax...causes error #}
--DATE_TRUNC('month', order_date) AS month,
SELECT
    order_id,customer_id,amount,status,updated_at
FROM {{ ref('raw_orders') }}
--DATE_TRUNC('month', order_date) AS month,
--pre_hook="grant select on {{ this }} to role ACCOUNTADMIN",
--post_hook=[ "grant select on {{ this }} to role ACCOUNTADMIN",
