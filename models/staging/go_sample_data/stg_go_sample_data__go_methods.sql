with 

source as (

    select * from {{ source('go_sample_data', 'go_methods') }}

),

renamed as (

    select
        order method code,
        order method type

    from source

)

select * from renamed
