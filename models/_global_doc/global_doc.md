-- Global doc for all fields that are used in multiple tables (type of Glossary)
-- Fields description

-- Field: _p_date
{% docs _p_date %}

Partition date. Equals to requested date of the trip

Mode: Required


{% enddocs %}


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


-- Field: hvfhs_license_num
{% docs hvfhs_license_num %}

The TLC license number of the HVFHS base or business
As of September 2019, the HVFHS licensees are the following:
• HV0002: Juno
• HV0003: Uber
• HV0004: Via
• HV0005: Lyft

Mode: Required


{% enddocs %}