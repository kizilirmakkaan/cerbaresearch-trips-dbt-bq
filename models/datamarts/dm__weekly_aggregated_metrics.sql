with

dim_date as  (
    select
        calendar_date
    from {{ ref("dim__date") }}
),

fct_trips as (
    select
         count(distinct trip_key) as count_trips
        ,date_trunc(DATETIME(request_datetime), WEEK) request_started_at_week
    from {{ ref("fct__trips") }}
)

select *
from fct_trips