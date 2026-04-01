--{{ dynamic_pivot('sales_data',['order_date', 'region'],'product_category','sales_amount')}}
{% macro mac_dynamic_pivot(table_name, group_by_columns, pivot_column, value_column) %} 
{% set group_by_str = group_by_columns | join(', ') %} 
{% set query %} 
    SELECT DISTINCT {{ pivot_column }} FROM {{ table_name }} ORDER BY 1 
{% endset %} 
{% set results = run_query(query) %} 

{% if execute %} 
      {% set pivot_values = results.columns[0].values() %} 
 {% else %} 
      {% set pivot_values = [] %} 
{% endif %} 

SELECT {{ group_by_str }}, 
 {% for i in pivot_values %} 
    SUM(CASE WHEN {{ pivot_column }} = '{{ i }}' THEN {{ value_column }} 
                                                 ELSE 0 
		END ) AS "{{ i }}" 
     {% if not loop.last %},
     {% endif %} 
 {% endfor %} 
   FROM {{ table_name }} 
   GROUP BY {{ group_by_str }} 
{% endmacro %} 
   please explain this with 1 real time data and table
output:::::
{#
SELECT
    region,
    SUM(CASE WHEN product = 'Laptop' THEN amount ELSE 0 END) AS "Laptop",
    SUM(CASE WHEN product = 'Phone' THEN amount ELSE 0 END) AS "Phone",
    SUM(CASE WHEN product = 'Tablet' THEN amount ELSE 0 END) AS "Tablet"
FROM sales_data
GROUP BY region
order_date	region	product_category	sales_amount
2024-01-01	East	Electronics	        100
2024-01-01	East	Clothing	        50
2024-01-01	West	Electronics	        200
2024-01-02	East	Food	            75
2024-01-02	West	Clothing	        125
#}