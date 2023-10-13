with 

source as (

    select * from {{ source('go_sample_data', 'go_products') }}

),

renamed as (

    select
        product_number,
        product_line,
        product_type,
        product_name,
        product_brand,
        product_color,
        unit_cost,
        unit_price

    from source

)

select * from renamed
