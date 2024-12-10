--Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT orders_id
, date_date
, SUM(margin) AS margin
, SUM(shipping_fee) AS shipping_fee
, SUM(logcost) AS logcost
,SUM(CAST(ship_cost AS FLOAT64)) AS ship_cost
, SUM(revenue) AS revenue
, SUM(quantity) AS quantity
, SUM(margin) + SUM(shipping_fee) - SUM(logcost) - SUM(CAST(ship_cost AS FLOAT64)) AS operational_margin
, SUM(logcost) + SUM(CAST(ship_cost AS FLOAT64)) AS operatonal_costs
FROM {{ref("int_orders_margin")}}
JOIN
{{ref("stg_raw__ship")}}
USING
(orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC