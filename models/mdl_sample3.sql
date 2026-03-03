--{% set run_date = var('run_date', modules.datetime.date.today().strftime('%Y-%m-%d')) %}
--{{ config(materialized='table') }}
SELECT
  *
FROM {{ ref('kamaleshwar') }}## chk to replace kamaleshwar
WHERE 1=1
  {% if var('filter_by_date', false) %}
AND transaction_date BETWEEN '{{ var("start_date") }}' AND '{{ var("end_date") }}'
  {% endif %}
  
  {% if var('filter_by_country', false) %}
AND country IN (
    {% for country in var('countries', []) %}
      '{{ country }}'{% if not loop.last %},{% endif %}
    {% endfor %}
  )
  {% endif %}  
--cretae table stg_transactions with transaction dates...
--var('filter_by_date', true) → If the variable is missing, it defaults to true, so the date filter will run.
--var('filter_by_date', false) → If the variable is missing, it defaults to false, so the date filter will not run.

{#
SELECT
  *
FROM employee
WHERE 1=1
and   transaction_date BETWEEN  start_date and  end_date
and   country IN (a,b,c,d)
#########
vars:
  # Analysis date range - used for filtering transaction data
  # Format: YYYY-MM-DD
  analysis_start_date: '2023-01-01'  # Inclusive
  analysis_end_date: '2023-12-31'    # Inclusive
dev:
    debug_mode: true                 # Enables additional logging
    data_sample_pct: 10              # Only process 10% of data in dev
  prod:
    debug_mode: false
    data_sample_pct: 100 
#}
