with finance as (
    select * 
    from {{ source('semantics', 'finance_data') }}
)
select * from finance