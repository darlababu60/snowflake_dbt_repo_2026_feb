
select g.*,
{{ sales_percentage1('g.PRODUCT_A_SALES', 'g.PRODUCT_B_SALES') }} as change0,
{{ sales_percentage1('g.PRODUCT_A_SALES', 'g.PRODUCT_C_SALES') }} as change1
from {{ source("kailash_sources","sales_and_costs") }} g

/*
select g.*,
{{ sales_percentage1(g.PRODUCT_A_SALES, g.PRODUCT_B_SALES) }} as change0,
{{ sales_percentage1(g.PRODUCT_A_SALES, g.PRODUCT_C_SALES) }} as change1
from {{ source("kailash_sources","sales_and_costs") }} g
--from {{ source("kailash_sources","PAYMENT_MODES")}}


select g.*,
{{ sales_percentage1('g.PRODUCT_A_SALES','g.PRODUCT_B_SALES') }} as change0,
{{ sales_percentage1('g.PRODUCT_A_SALES','g.PRODUCT_C_SALES') }} as change1
from {{source("kailash_sources","sales_and_costs")}} g
*/
