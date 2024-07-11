with patient as (
    select 
        patient_id, churn, start_date, churn_date,
        insurance_type,age, gender, address, medical_history
    from {{ ref('stg_patient') }}
)
select * from patient
