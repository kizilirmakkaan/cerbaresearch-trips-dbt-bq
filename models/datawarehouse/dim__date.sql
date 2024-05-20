{{ config(materialized='table') }}

with dates as (
    select 
        date_day as calendar_date
        ,day_of_week
        ,year_number as calendar_year
        ,month_of_year as calendar_month
    from {{ ref("staging__dates") }}
)

select *
from dates
order by calendar_date asc