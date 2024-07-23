with cte_unpivot as (
    select 
        patient_id, 
        start_date as date, 
        'start_date' as date_type
    from {{ ref("int_churn_date") }}
    where start_date is not null and termination_date is not null

        union all

    select 
        patient_id, 
        termination_date as date, 
        'termination_date' as date_type
    from {{ ref("int_churn_date") }}
    where start_date is not null and termination_date is not null
)
select 
    to_number(to_char(date, 'YYYYMMDD')) as dim_termination_date_key,
    patient_id, 
    date, 
    date_type
from cte_unpivot 

