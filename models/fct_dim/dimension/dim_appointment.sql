with appt as (
    select 
        to_number(to_char(appointment_date, 'YYYYMMDD')) as appointment_id,
        appointment_date, appointment_type,
        doctor_id, patient_id 
    from {{ ref('raw_semantic_patient') }}
)
select * from appt