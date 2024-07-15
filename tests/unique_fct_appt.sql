-- tests/unique_fact_appointments.sql
select
    patient_id,
    appointment_date,
    count(*)
from {{ ref('fct_appointment') }}
group by patient_id, appointment_date
having count(*) > 1