with churn_date as (
    select 
        distinct(patient_id),
        --patient_id,
        churn,
        start_date,
        churn_date as termination_date
    from {{ ref('raw_semantic_patient') }}
)
select * from churn_date
