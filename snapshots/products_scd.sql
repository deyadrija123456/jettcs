{% snapshot dim_products_scd %}

config(

target_database='analytics',
target_schema='BUS',
unique_key=['product_id'],
strategy='timestamp',
updated_at='update_at',
)
}}

select * from {{ ref('stg_products') }}

(% endsnapshot %}