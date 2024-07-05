with fct_patient as (
    select 
        patient_id, appointment_date,
        appointment_type, churn
    from {{ ref('raw_semantic_patient') }} 
)
select * from fct_patient