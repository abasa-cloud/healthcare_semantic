with churn_date as (
    select 
        distinct(patient_id),
        --patient_id,
        churn,
        start_date,
        churn_date as termination_date
    from {{ ref('stg_patient') }}
)
select * from churn_date
