-- Margin = Revenue - Purchase_cost
-- Purchase_cost = Quantity * Purchase_price

SELECT orders_id
, date_date
, revenue
, quantity
, revenue - (quantity * CAST(purchase_price AS FLOAT64)) AS margin
, quantity * CAST(purchase_price AS FLOAT64) AS purchase_cost
, {{ margin_percent ('revenue' ,'quantity * CAST(purchase_price AS FLOAT64)')}} AS margin_percent
FROM {{ref("stg_raw__sales")}}
JOIN 
{{ref("stg_raw__product")}}
USING
(products_id)