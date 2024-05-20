{% macro incremental_partition_config(partition_date_field=none) %}

{{
config(
      materialized = 'incremental'
    , incremental_strategy='insert_overwrite'
    , on_schema_change = 'append_new_columns'
    , partition_by = {
        'field': partition_date_field,
        'data_type': 'date',
        'granularity': 'day'
    }
) 
}}
{% endmacro %}