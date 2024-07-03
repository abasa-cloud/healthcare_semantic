with patient as (
    select 
        patient_id, 
        age, 
        gender,
        churn, 
        start_date, 
        insurance_type,
        address, 
        medical_history
    from {{ ref('raw_semantic_patient') }}
),

appt as (
    select 
        patient_id,
        appointment_date,
        appointment_type,
        doctor_id
    from {{ ref('raw_semantic_appt') }}
), 

final as (
    select 
        p.patient_id, 
        p.age, 
        p.gender,
        p.churn, 
        p.start_date, 
        p.insurance_type,
        p.address, 
        p.medical_history,
        a.appointment_date, 
        a.appointment_type,
        a.doctor_id
    from patient p 
    left join appt a 
        on p.patient_id = a.patient_id
)
select * from final