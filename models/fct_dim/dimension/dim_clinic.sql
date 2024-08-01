with dim_clinic as (
    select 
        clinic_id,
        clinic_name,
        clinic_city,
        clinic_state,
        clinic_region,
        number_of_doctors,
        rating
    from {{ ref('stg_clinic') }}
)
select * from dim_clinic