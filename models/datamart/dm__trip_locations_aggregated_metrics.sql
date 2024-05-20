with

dim_date as  (
    select
        date_trunc(DATETIME(calendar_date), MONTH) as start_of_the_month
        ,calendar_year
        ,calendar_month
    from {{ ref("dim__date") }}
    group by all
),

fct_trips as (
    select
         {{ trip_metrics() }}
        ,pulocationid
        ,date_trunc(DATETIME(request_datetime), MONTH) request_started_at_month
    from {{ ref("fct__trips") }}
    group by all
),

joined as (
    select
        fct_trips.*
        ,dim_date.*
    from fct_trips
    left join dim_date
    on fct_trips.request_started_at_month = dim_date.start_of_the_month
)


select 
    -- date fields
     start_of_the_month
    ,calendar_month
    ,calendar_year

    ,pulocationid

    -- measures
    ,count_trips
    ,sum_total_cost_to_passenger
    ,sum_trip_miles
    ,sum_trip_time

from joined