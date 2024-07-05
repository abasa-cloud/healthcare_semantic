with dim_date as (
    select 
        substr(uuid_string(),1,7) as date_key,
        appointment_date,
        extract(day from appointment_date) as day,
        extract(week from appointment_date) as week, 
        extract(month from appointment_date) as month,
        extract(year from appointment_date) as year,
        extract(quarter from appointment_date) as quarter
    from {{ source('semantics', 'appt_data') }}
)

select * from dim_date