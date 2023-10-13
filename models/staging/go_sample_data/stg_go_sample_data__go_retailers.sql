with 

source as (

    select * from {{ source('go_sample_data', 'go_retailers') }}

),

renamed as (

    select
        retailer code,
        retailer name,
        type,
        country

    from source

)

select * from renamed
