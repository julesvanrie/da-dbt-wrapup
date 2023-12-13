with 

source as (

    select * from {{ source('raw', 'parcel_product') }}

),

renamed as (

    select
        parcel_id,
        model_mame as model_name,
        quantity

    from source

)

select * from renamed
