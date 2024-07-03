with semantic_usage as (
    select *
    from {{ source('semantics', 'usage_data') }}
)
select * from semantic_usage