{{ incremental_partition_config("_p_date") }}


with

source_trips as (
    select
        *
    from {{ ref("staging_trips") }}
),

final as (
    select

         _p_date
        -- identifiers keys
        ,trip_key
        ,hvfhs_license_num
        ,dispatching_base_num
        ,originating_base_num

        ,pulocationid
        ,dolocationid

        -- datetime fields
        ,request_datetime
        ,request_date
        ,on_scene_datetime
        ,pickup_datetime
        ,dropoff_datetime


        -- trip attributes
        ,trip_miles
        ,trip_time
        
        ,is_shared_request
        ,is_shared_match
        ,is_access_a_ride
        ,is_wav_request
        ,is_wav_match


        -- monetary info
        ,base_passenger_fare
        ,tolls
        ,bcf
        ,sales_tax
        ,congestion_surcharge
        ,airport_fee
        ,tips
        ,driver_pay
        
        -- TOTAL COST
        ,base_passenger_fare + tolls + bcf + sales_tax + congestion_surcharge + airport_fee as total_cost_to_passenger

    from source_trips
)

select *
from final