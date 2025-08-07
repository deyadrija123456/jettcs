
{{ config(materialized='table') }}

with product as (
select
sku as product_id,
name as product_name,
description as product_desc,
case when type = 'jaffle' then 1 else 0 end as is_food_item,
case when type = 'beverage' then 1 else 0 end as is_drink_item
type as product_type,
price / 100 as product_price,
from {{ source('src', 'products') }}
)

select * from product