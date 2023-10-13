with 

source as (

    select * from {{ source('go_sample_data', 'go_retailers') }}

),

renamed as (

    select
        retailer_code,
        retailer_name,
        retailer_type,
        retailer_country

    from source

)

select * from renamed
