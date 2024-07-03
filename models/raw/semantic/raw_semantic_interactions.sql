with interaction as (
    select * 
    from {{ source('semantics', 'interactions_data') }}
)
select * from interaction