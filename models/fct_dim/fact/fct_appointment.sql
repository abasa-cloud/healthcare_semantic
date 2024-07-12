with appt as (
    select *
    from {{ ref('stg_appt') }}
),

patient as (
    select *
    from {{ ref('stg_patient') }}
), 

fct_appt as (
    select 
        distinct to_number(to_char(a.appointment_date, 'YYYYMMDD')) 
            || '-' || p.patient_id as dim_appt_key,
        a.appointment_date,
        a.appointment_type,
        a.doctor_id,
        p.patient_id,
        p.start_date,
        p.insurance_type,
        p.age,
        p.gender,
        p.address,
        p.churn
    from appt a 
    cross join patient p 
        --on a.patient_id = p.patient_id
)
select * from fct_appt 
order by appointment_date desc


