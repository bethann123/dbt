with 

source as (

    select * from {{ source('go_sample_data', 'go_products') }}

),

renamed as (

    select
        product number,
        product line,
        product type,
        product,
        product brand,
        product color,
        unit cost,
        unit price

    from source

)

select * from renamed
