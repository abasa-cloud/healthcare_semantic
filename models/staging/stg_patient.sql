with stg_patient as (
    select *
    from {{ source('semantics', 'patient_raw') }}
)
select * from stg_patient 
