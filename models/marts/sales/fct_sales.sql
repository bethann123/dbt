{{
    config(
        materialized='table'
    )
}}

with source_sales as (
    select * from {{ ref('stg_go_sample_data__go_daily_sales') }}
)

,source_methods as (
    select * from {{ ref('stg_go_sample_data__go_methods') }}
)

,source_products as (
    select * from {{ ref('stg_go_sample_data__go_products') }}
)

,source_retailers as (
    select * from {{ ref('stg_go_sample_data__go_retailers') }}
)


,transform as (

    select
        ss.sale_date,
        ss.retailer_code,
        sr.retailer_name,
        sp.product_number,
        sp.product_name,
        sm.order_method_type,
        ss.sales_quantity,
        ss.unit_price,
        ss.unit_sale_price,
        ss.sales_quantity*ss.unit_sale_price as total_amount,
        ss.sales_quantity*ss.unit_price as total_amount_before_discount,
        total_amount - total_amount_before_discount as discount_amount
    from source_sales ss
    left join source_retailers sr
    on ss.retailer_code = sr.retailer_code
    left join source_methods sm
    on ss.order_method_code = sm.order_method_code
    left join source_products sp
    on ss.product_number = sp.product_number
    )



select * from transform