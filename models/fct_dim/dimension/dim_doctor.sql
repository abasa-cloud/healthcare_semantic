with dim_doctor as (
    select
        doctor_id,
        specialty,
        clinic_name,
        clinic_id,
        clinic_city as city,
        clinic_state as state,
        clinic_region as region

    from {{ ref('stg_doctor') }}
)
select * from dim_doctor