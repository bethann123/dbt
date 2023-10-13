with 

source as (

    select * from {{ source('go_sample_data', 'go_methods') }}

),

renamed as (

    select
        order_method_code,
        order_method_type

    from source

)

select * from renamed
