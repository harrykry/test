{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_resistance') }}
select
    {{ json_extract_scalar('_airbyte_data', ['ResistanceDateTime'], ['ResistanceDateTime']) }} as resistancedatetime,
    {{ json_extract_scalar('_airbyte_data', ['Temperature'], ['Temperature']) }} as temperature,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['ResistanceR12'], ['ResistanceR12']) }} as resistancer12,
    {{ json_extract_scalar('_airbyte_data', ['ResistanceR34'], ['ResistanceR34']) }} as resistancer34,
    {{ json_extract_scalar('_airbyte_data', ['ResistanceR56'], ['ResistanceR56']) }} as resistancer56,
    {{ json_extract_scalar('_airbyte_data', ['ResistanceResult'], ['ResistanceResult']) }} as resistanceresult,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_resistance') }} as table_alias
-- data_resistance
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

