{{ config(schema = 'tests' ) }}

select order_id, sum(order_total) order_total
from {{ ref('stg_orders') }}
group by 1
having (order_total>4)