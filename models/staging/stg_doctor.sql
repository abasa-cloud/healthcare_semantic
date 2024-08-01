with stg_doctor as (
    select * 
    from {{ source('semantics', 'doctor_raw') }}
)
select * from stg_doctor