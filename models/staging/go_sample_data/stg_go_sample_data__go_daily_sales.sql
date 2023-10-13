with 

source as (

    select * from {{ source('go_sample_data', 'go_daily_sales') }}

),

renamed as (

    select
        retailer_code,
        product_number,
        order_method_code,
        sale_date,
        sales_quantity,
        unit_price,
        unit_sale_price

    from source

)

select * from renamed
