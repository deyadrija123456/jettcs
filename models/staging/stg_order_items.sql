-- models/staging/stg_order_items.sql

select
    id as order_item_id,
    order_id,
    product_id,
    quantity,
    price,
    created_at,
    updated_at
from {{ source('raw', 'order_items') }}
