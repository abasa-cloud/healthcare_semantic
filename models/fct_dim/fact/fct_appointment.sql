with appt as (
    select *
    from {{ ref('int_appt') }}
),

patient as (
    select *
    from {{ ref('stg_patient') }}
), 

corp_date as (
    select 
        dim_date_key
    from {{ ref('dim_corp_date') }}
),

dr_data as (
    select *
    from {{ ref('dim_doctor') }}
),

clinic as (
    select *
    from {{ ref('stg_clinic') }}
),

fct_appt as (
    select 
        a.appt_key,
        a.appt_date_key,
        c.dim_date_key,
        a.appointment_date,
        a.appointment_type,
        a.doctor_id,
        d.clinic_id,
        d.city,
        d.state,
        d.region,
        d.specialty,
        p.patient_id,
        p.start_date,
        p.churn_date,
        p.insurance_type,
        p.age,
        p.gender,
        p.address,
        p.churn

    from appt a 
    left join patient p 
        on a.patient_id = p.patient_id
    left join corp_date c
        on a.appt_date_key = c.dim_date_key
    left join dr_data d 
        on a.doctor_id = d.doctor_id
)
select * from fct_appt 