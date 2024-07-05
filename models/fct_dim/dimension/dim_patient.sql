with patient as (
    select 
        patient_id, churn, start_date, insurance_type,
        age, gender, address, medical_history
    from {{ ref('raw_semantic_patient') }}
)
select * from patient