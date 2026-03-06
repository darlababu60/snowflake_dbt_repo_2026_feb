{% test tst_mac_duplicate_count(model, column_name, error_threshold=0) %}
{% set threshold = error_threshold if error_threshold is not none else 0 %}
with validation_errors as (
    select {{ column_name }}
    from {{ model }}
    where {{ column_name }} is not null
    group by {{ column_name }}
    having count(*) > 1
),
aggregated as (
    select count(*) as n_errors
    from validation_errors
)
select *
from aggregated
where 
false -- or -->n_errors > {{ threshold }}
--true   --false
{% endtest %}
--if  where condition true-->1>0 or 2>0 or 3>0...it will give output records as 1 or 2 or 3..so Got 1 or 2 or 3 result, configured to fail if != 0..then something is problem.
--if where conditon false-->0>0.....................then it will not give output records..........so Got 0 result, configured to fail if != 0...then nothing is problem.