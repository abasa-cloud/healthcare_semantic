with int_appt as (
    select 
        to_char(appointment_date, 'YYYYMMDD') as appt_date_key,
        appt_key,
        patient_id,
        appointment_date,
        appointment_type,
        doctor_id
    from {{ ref('stg_appt') }}
)
select * from int_appt 