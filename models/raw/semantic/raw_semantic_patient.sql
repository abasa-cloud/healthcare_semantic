with patient as (
    select * 
    from {{ source('semantics', 'patient_data') }}
), 

appt as (
    select * 
    from {{ source('semantics', 'appt_data') }}
), 

final as (
    select 
        p.patient_id, 
        p.churn, 
        p.start_date, 
        p.insurance_type,
        p.age,
        p.gender,
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