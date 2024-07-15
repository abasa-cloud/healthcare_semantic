with appt as (
    select *
    from {{ ref('stg_appt') }}
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

fct_appt as (
    select 
        a.appt_date_key,
        c.dim_date_key,
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
    from stg_appt a 
    left join stg_patient p 
        on a.patient_id = p.patient_id
    left join dim_corp_date c
        on a.appt_date_key = c.dim_date_key   
)
select * from fct_appt 
--order by appointment_date desc



