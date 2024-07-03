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

usage as (
    select 
        patient_id,
        portal_logins as user_logins,
        telehealth_sessions as online_appointment
    from {{ ref('raw_semantic_usage') }}
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
        u.user_logins, 
        u.online_appointment
    from patient p 
    left join usage u
        on p.patient_id = u.patient_id
)

select * from final
