with dates as (
    {{ dbt_date.get_date_dimension("2020-01-01", "2030-12-31") }}
)

select *
from dates