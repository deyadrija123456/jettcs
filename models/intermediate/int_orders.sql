{{ config (materialised = 'incremental') }}

with stg_orders as
( select * from {{ref("stg_orders")}}),

stg_order_items as
( select * from {{ref("stg_order_items")}})

select a.order_id,
a.location_id,
a.customer_id,
a.order_total,
a.tax_paid,
a.ordered_at,
b.ORDER_ITEM_ID,
b.PRODUCT_ID,
{{ConvertCurrency('a.order_total','3','EUR') }]} as Order_Total_EUR,
{{ConvertCurrency('a.order_total','2', 'YEN' ) }} as Order_Total_YEN
from
stg_orders a
join stg_order_items b
on a.order_id-b.orderid
where a.ordered_at <= '{{ var ("order_after_date")}} 