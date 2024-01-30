SELECT 
orders_id
, MAX(date_date) as date_date
, ROUND(SUM(revenue),2) as revenue
, SUM(quantity) AS quantity
, ROUND(SUM(margin),2) AS margin
, ROUND(SUM(purchase_cost),2) as purchase_cost
FROM{{ref("int_sales_margin")}}
GROUP BY orders_id
ORDER BY orders_id DESC