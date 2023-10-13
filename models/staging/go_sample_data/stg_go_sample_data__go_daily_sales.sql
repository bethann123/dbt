with 

source as (

    select * from {{ source('go_sample_data', 'go_daily_sales') }}

),

renamed as (

    select
        retailer code,
        product number,
        order method code,
        date,
        quantity,
        unit price,
        unit sale price

    from source

)

select * from renamed
