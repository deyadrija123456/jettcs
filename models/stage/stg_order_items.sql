{{ config(materialized-'table') }}

with tablename as (

select id as product_id,order_id from
{{ source('src', 'items') }})

select *
from tablename