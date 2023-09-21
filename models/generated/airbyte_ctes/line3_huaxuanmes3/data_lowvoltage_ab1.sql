{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_lowvoltage') }}
select
    {{ json_extract_scalar('_airbyte_data', ['PP'], ['PP']) }} as pp,
    {{ json_extract_scalar('_airbyte_data', ['WC10'], ['WC10']) }} as wc10,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['Max'], ['Max']) }} as max,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['Sine'], ['Sine']) }} as sine,
    {{ json_extract_scalar('_airbyte_data', ['Low_VoltageTime'], ['Low_VoltageTime']) }} as low_voltagetime,
    {{ json_extract_scalar('_airbyte_data', ['Result'], ['Result']) }} as result,
    {{ json_extract_scalar('_airbyte_data', ['Zero_Voltage'], ['Zero_Voltage']) }} as zero_voltage,
    {{ json_extract_scalar('_airbyte_data', ['Sinusoidal_Phase_Shift'], ['Sinusoidal_Phase_Shift']) }} as sinusoidal_phase_shift,
    {{ json_extract_scalar('_airbyte_data', ['L2Sin'], ['L2Sin']) }} as l2sin,
    {{ json_extract_scalar('_airbyte_data', ['L4Sin'], ['L4Sin']) }} as l4sin,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['Input_Resistance'], ['Input_Resistance']) }} as input_resistance,
    {{ json_extract_scalar('_airbyte_data', ['L1'], ['L1']) }} as l1,
    {{ json_extract_scalar('_airbyte_data', ['L2'], ['L2']) }} as l2,
    {{ json_extract_scalar('_airbyte_data', ['L3'], ['L3']) }} as l3,
    {{ json_extract_scalar('_airbyte_data', ['Excitation1'], ['Excitation1']) }} as excitation1,
    {{ json_extract_scalar('_airbyte_data', ['L4'], ['L4']) }} as l4,
    {{ json_extract_scalar('_airbyte_data', ['Excitation2'], ['Excitation2']) }} as excitation2,
    {{ json_extract_scalar('_airbyte_data', ['WC4'], ['WC4']) }} as wc4,
    {{ json_extract_scalar('_airbyte_data', ['Phase_Shift'], ['Phase_Shift']) }} as phase_shift,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['WC8'], ['WC8']) }} as wc8,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['Min'], ['Min']) }} as min,
    {{ json_extract_scalar('_airbyte_data', ['Electrical_Difference'], ['Electrical_Difference']) }} as electrical_difference,
    {{ json_extract_scalar('_airbyte_data', ['L1Sin'], ['L1Sin']) }} as l1sin,
    {{ json_extract_scalar('_airbyte_data', ['L3Sin'], ['L3Sin']) }} as l3sin,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    {{ json_extract_scalar('_airbyte_data', ['Cosine'], ['Cosine']) }} as cosine,
    {{ json_extract_scalar('_airbyte_data', ['Voltage_fluctuation_rate'], ['Voltage_fluctuation_rate']) }} as voltage_fluctuation_rate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_lowvoltage') }} as table_alias
-- data_lowvoltage
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

