with appt as (
    select *
    from {{ source('semantics', 'appt_raw') }}
)
select * from appt