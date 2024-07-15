with appt as (
    select 
        distinct to_number(to_char(appointment_date, 'YYYYMMDD')) as appt_date_key,
        *
    from {{ source('semantics', 'appt_data') }}
)
select * from appt