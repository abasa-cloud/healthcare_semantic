with corp_time as (
    select * 
    from {{ source('semantics', 'corp_time_table') }}
)
select * from corp_time