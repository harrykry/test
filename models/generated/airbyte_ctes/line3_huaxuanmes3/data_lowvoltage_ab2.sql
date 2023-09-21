{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_lowvoltage_ab1') }}
select
    cast(pp as {{ dbt_utils.type_string() }}(1024)) as pp,
    cast(wc10 as {{ dbt_utils.type_string() }}(1024)) as wc10,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(max as {{ dbt_utils.type_string() }}(1024)) as max,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(sine as {{ dbt_utils.type_string() }}(1024)) as sine,
    cast(low_voltagetime as {{ dbt_utils.type_string() }}(1024)) as low_voltagetime,
    cast(result as {{ dbt_utils.type_string() }}(1024)) as result,
    cast(zero_voltage as {{ dbt_utils.type_string() }}(1024)) as zero_voltage,
    cast(sinusoidal_phase_shift as {{ dbt_utils.type_string() }}(1024)) as sinusoidal_phase_shift,
    cast(l2sin as {{ dbt_utils.type_string() }}(1024)) as l2sin,
    cast(l4sin as {{ dbt_utils.type_string() }}(1024)) as l4sin,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(input_resistance as {{ dbt_utils.type_string() }}(1024)) as input_resistance,
    cast(l1 as {{ dbt_utils.type_string() }}(1024)) as l1,
    cast(l2 as {{ dbt_utils.type_string() }}(1024)) as l2,
    cast(l3 as {{ dbt_utils.type_string() }}(1024)) as l3,
    cast(excitation1 as {{ dbt_utils.type_string() }}(1024)) as excitation1,
    cast(l4 as {{ dbt_utils.type_string() }}(1024)) as l4,
    cast(excitation2 as {{ dbt_utils.type_string() }}(1024)) as excitation2,
    cast(wc4 as {{ dbt_utils.type_string() }}(1024)) as wc4,
    cast(phase_shift as {{ dbt_utils.type_string() }}(1024)) as phase_shift,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(wc8 as {{ dbt_utils.type_string() }}(1024)) as wc8,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(min as {{ dbt_utils.type_string() }}(1024)) as min,
    cast(electrical_difference as {{ dbt_utils.type_string() }}(1024)) as electrical_difference,
    cast(l1sin as {{ dbt_utils.type_string() }}(1024)) as l1sin,
    cast(l3sin as {{ dbt_utils.type_string() }}(1024)) as l3sin,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(cosine as {{ dbt_utils.type_string() }}(1024)) as cosine,
    cast(voltage_fluctuation_rate as {{ dbt_utils.type_string() }}(1024)) as voltage_fluctuation_rate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_lowvoltage_ab1') }}
-- data_lowvoltage
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

