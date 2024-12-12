{% macro margin_percent2(revenue, purchase_cost) %}
     ({{revenue}} - {{purchase_cost}}) / {{revenue}}
 {% endmacro %}