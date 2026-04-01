select *
from {{ ref('mdl_orders') }}
where amount < 0