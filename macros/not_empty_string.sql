{% test not_empty_string(mdl_naresh, dpno) %}
select *
from {{ mdl_naresh }}
where {{ dpno }} is null
   or trim({{ dpno }}) = ''

{% endtest %}
-- still pending in model just coped from chatgpt...
--ok done
--test it
--waiting