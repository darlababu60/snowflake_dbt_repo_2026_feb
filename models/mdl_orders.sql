{{ config(materialized='table'
 ) }}
            
select order_id,customer_id,product,amount   from {{ source("kailash_sources","orders") }} 