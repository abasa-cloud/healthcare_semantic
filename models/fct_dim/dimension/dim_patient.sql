with patient as (
    select distinct 
        p.patient_id,
        p.churn, 
        p.start_date, 
        p.churn_date,
        d.dim_date_key,
        p.insurance_type,
        p.age, 
        p.gender, 
        p.address, 
        p.medical_history
    from {{ ref('stg_patient') }} p 
    left join {{ ref('dim_corp_date') }} d
        on p.patient_id = d.patient_id 
)
select * from patient
