with appt as (
    select *
    from {{ source('semantics', 'appt_data') }}
)
select * from appt