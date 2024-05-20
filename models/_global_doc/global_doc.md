-- Global doc for all fields that are used in multiple tables (type of Glossary)
-- Fields description

-- Field: trip_key
{% docs trip_key %}

Primary key of a trip.

Mode: Nullable

Key is generated (built and hashed) on the following columns:
- hvfhs_license_num
- request_datetime
- pickup_datetime
- dropoff_datetime
- pulocationid
- dolocationid
- dispatching_base_num
- originating_base_num
- trip_miles
- base_passenger_fare

{% enddocs %}