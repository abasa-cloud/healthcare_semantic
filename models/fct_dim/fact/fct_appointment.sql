with appt as (
    select *
    from {{ source('semantics', 'appt_data') }}
), 

patient as (
    select * 
    from {{ source('semantics', 'patient_data') }}
), 

fct_appt as (
    select 
        a.patient_id,
        a.appointment_date,
        a.appointment_type,
        p.churn,
        p.start_date, 
        p.insurance_type,
        p.age,
        p.gender, 
        p.address, 
        p.medical_history
    from appt a 
    left join patient p 
        on a.patient_id = p.patient_id
)
select * from fct_appt