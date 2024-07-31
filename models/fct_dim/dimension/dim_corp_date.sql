-- CREATE OR REPLACE TABLE time_table AS 
with recursive
    daterange as (
        select to_date('2020-01-01') as full_date
        union all
        select dateadd(day, 1, full_date)
        from {{ source('semantics', 'corp_time_table') }}
        where full_date < to_date('2025-12-31')
    )
select
    cast (to_char(full_date, 'YYYYMMDD') as date) as dim_date_key,
    full_date,
    year(full_date) as year,
    month(full_date) as month,
    day(full_date) as day,
    dayofweek(full_date) as day_of_week,
    dayname(full_date) as day_name,
    monthname(full_date) as month_name
from daterange
