{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_tigweld') }}
select
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['TigSingleResult'], ['TigSingleResult']) }} as tigsingleresult,
    {{ json_extract_scalar('_airbyte_data', ['AltitdeIntercept'], ['AltitdeIntercept']) }} as altitdeintercept,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['EccentricDistance'], ['EccentricDistance']) }} as eccentricdistance,
    {{ json_extract_scalar('_airbyte_data', ['TigAisle'], ['TigAisle']) }} as tigaisle,
    {{ json_extract_scalar('_airbyte_data', ['TigResult'], ['TigResult']) }} as tigresult,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['TigCurrent'], ['TigCurrent']) }} as tigcurrent,
    {{ json_extract_scalar('_airbyte_data', ['TigTime'], ['TigTime']) }} as tigtime,
    {{ json_extract_scalar('_airbyte_data', ['EndDateTime'], ['EndDateTime']) }} as enddatetime,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['TigCCDResult'], ['TigCCDResult']) }} as tigccdresult,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    {{ json_extract_scalar('_airbyte_data', ['Diameter'], ['Diameter']) }} as diameter,
    {{ json_extract_scalar('_airbyte_data', ['Distance'], ['Distance']) }} as distance,
    {{ json_extract_scalar('_airbyte_data', ['TigVolt'], ['TigVolt']) }} as tigvolt,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_tigweld') }} as table_alias
-- data_tigweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

