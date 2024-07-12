-- tests/unique_fact_appointments.sql
select
    patient_id,
    appointment_date,
    count(*)
from {{ ref('fact_appointment') }}
group by patient_id, appointment_date
having count(*) > 1