with churn as (
    select * 
    from {{ source('semantics', 'churn_data') }}
)
select * from churn