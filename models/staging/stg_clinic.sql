with stg_clinic as (
    select *
    from {{ source('semantics', 'clinic_raw') }}
)
select * from stg_clinic