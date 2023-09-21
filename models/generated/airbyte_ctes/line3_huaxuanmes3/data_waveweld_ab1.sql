{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_waveweld') }}
select
    {{ json_extract_scalar('_airbyte_data', ['Amplitude'], ['Amplitude']) }} as amplitude,
    {{ json_extract_scalar('_airbyte_data', ['ULOperator'], ['ULOperator']) }} as uloperator,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['AccumulatedEnergy'], ['AccumulatedEnergy']) }} as accumulatedenergy,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['Time'], ['Time']) }} as {{ adapter.quote('Time') }},
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['FlyLine'], ['FlyLine']) }} as flyline,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['Pressure'], ['Pressure']) }} as pressure,
    {{ json_extract_scalar('_airbyte_data', ['Result'], ['Result']) }} as result,
    {{ json_extract_scalar('_airbyte_data', ['ResultSingle'], ['ResultSingle']) }} as resultsingle,
    {{ json_extract_scalar('_airbyte_data', ['EndDateTime'], ['EndDateTime']) }} as enddatetime,
    {{ json_extract_scalar('_airbyte_data', ['Operator_'], ['Operator_']) }} as operator_,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['MaxPower'], ['MaxPower']) }} as maxpower,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['LineOrder'], ['LineOrder']) }} as lineorder,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_waveweld') }} as table_alias
-- data_waveweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

