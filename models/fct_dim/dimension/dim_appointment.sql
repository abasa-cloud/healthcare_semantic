with appt as (
    select 
        substr(uuid_string(),1,5) as appointment_id,
        appointment_date, appointment_type,
        doctor_id, patient_id 
    from {{ ref('raw_semantic_patient') }}
)
select * from appt