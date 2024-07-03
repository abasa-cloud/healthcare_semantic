with patient as (
    select * 
    from {{ source('semantics', 'patient_data') }}
)
select * from patient