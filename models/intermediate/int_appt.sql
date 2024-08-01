with int_appt as (
    select 
        to_char(a.appointment_date, 'YYYYMMDD') as appt_date_key,
        a.appt_key,
        a.patient_id,
        a.appointment_date,
        a.appointment_type,
        a.doctor_id,
        d.clinic_id
    from {{ ref('stg_appt') }} a
    left join {{ ref('dim_doctor') }} d 
        on a.doctor_id = d.doctor_id
)
select * from int_appt 