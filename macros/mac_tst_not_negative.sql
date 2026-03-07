{% test  mac_tst_not_negative(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} < 0
{% endtest %}
--where {{ 10 }} < 0----TRUE
--where order_date > current_date
-- column_name model