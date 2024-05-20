{% macro trip_metrics() %}

 count(distinct trip_key) as count_trips
,sum(total_cost_to_passenger) as sum_total_cost_to_passenger
,sum(trip_miles) as sum_trip_miles
,sum(trip_time) as sum_trip_time 

{% endmacro %}