SELECT
  *
FROM {{ ref('stg_transactions') }}
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

#}
