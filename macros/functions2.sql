{% macro margin_percent2(revenue, purchase_cost)%}
ROUND(SAFE_DIVIDE(revenue - purchase_cost,revenue),2)
{% endmacro%}