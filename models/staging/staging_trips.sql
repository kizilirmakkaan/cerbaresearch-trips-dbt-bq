with

source_trips as (
    select *
    from {{ source("cerbaresearch", "tripdata_2024_01") }}
),

casted as (
    select

         cast(hvfhs_license_num as string) as hvfhs_license_num
        ,cast(dispatching_base_num as string) as dispatching_base_num
        ,cast(originating_base_num as string) as originating_base_num

        ,cast(request_datetime as timestamp) as request_datetime
        ,cast(on_scene_datetime as timestamp) as on_scene_datetime
        ,cast(pickup_datetime as timestamp) as pickup_datetime
        ,cast(dropoff_datetime as timestamp) as dropoff_datetime

        ,cast(pulocationid as string) as pulocationid
        ,cast(dolocationid as string) as dolocationid

        ,cast(trip_miles as float64) as trip_miles
        ,cast(trip_time as int64) as trip_time

        ,cast(base_passenger_fare as float64) as base_passenger_fare
        ,cast(tolls as float64) as tolls
        ,cast(bcf as float64) as bcf
        ,cast(sales_tax as float64) as sales_tax
        ,cast(congestion_surcharge as float64) as congestion_surcharge
        ,cast(airport_fee as float64) as airport_fee
        ,cast(tips as float64) as tips
        ,cast(driver_pay as float64) as driver_pay

        ,cast(
            case shared_request_flag
                when "N" then false
                else true
                end
         as boolean) as is_shared_request

        ,cast(
            case shared_match_flag
                when "N" then false
                else true
                end
         as boolean) as is_shared_match
        
        ,cast(
            case access_a_ride_flag
                when "N" then false
                else true
                end
         as boolean) as is_access_a_ride
        
        ,cast(
            case wav_request_flag
                when "N" then false
                else true
                end
         as boolean) as is_wav_request
        
        ,cast(
            case wav_match_flag
                when "N" then false
                else true
                end
         as boolean) as is_wav_match
         
    from source_trips
),

-- Construct a unique key for trips
with_pk as (
    select 
        *
        ,{{ dbt_utils.generate_surrogate_key([
            'hvfhs_license_num',
            'request_datetime',
            'pickup_datetime',
            'dropoff_datetime',
            'pulocationid',
            'dolocationid',
            'dispatching_base_num',
            'coalesce(originating_base_num, " ")',
            'trip_miles',
            'base_passenger_fare'
            ]) }} 
        as trip_key
    from casted 
)

select *
from casted