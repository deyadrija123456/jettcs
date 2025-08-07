{{ config(materialized-'table') }}

with orders as (select ID as Order_ID, store_id as location_id, customer_id,
order_total/100 as order_total,
TO_DATE(ordered_at) as Ordered_at
(tax_paid*100)/subtotal as tax_paid,

from {{ source('src', 'orders') }})
select * from orders where order_total>0