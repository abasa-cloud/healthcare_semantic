with appt as (
    select 
        distinct cast (to_char(appointment_date, 'YYYYMMDD') as date) as appt_date_key,
        *
    from {{ source('semantics', 'appt_data') }}
)
select * from appt