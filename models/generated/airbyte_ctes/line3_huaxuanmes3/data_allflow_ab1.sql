{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_allflow') }}
select
    {{ json_extract_scalar('_airbyte_data', ['ReelLine1'], ['ReelLine1']) }} as reelline1,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['Resistance3'], ['Resistance3']) }} as resistance3,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['LowVoltage7'], ['LowVoltage7']) }} as lowvoltage7,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['HighVoltage8'], ['HighVoltage8']) }} as highvoltage8,
    {{ json_extract_scalar('_airbyte_data', ['GP1210'], ['GP1210']) }} as gp1210,
    {{ json_extract_scalar('_airbyte_data', ['WaveWeld6'], ['WaveWeld6']) }} as waveweld6,
    {{ json_extract_scalar('_airbyte_data', ['StartDateTime'], ['StartDateTime']) }} as startdatetime,
    {{ json_extract_scalar('_airbyte_data', ['LaserEngraving9'], ['LaserEngraving9']) }} as laserengraving9,
    {{ json_extract_scalar('_airbyte_data', ['EndDateTime'], ['EndDateTime']) }} as enddatetime,
    {{ json_extract_scalar('_airbyte_data', ['TigWeld2'], ['TigWeld2']) }} as tigweld2,
    {{ json_extract_scalar('_airbyte_data', ['TunnelStove5'], ['TunnelStove5']) }} as tunnelstove5,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    {{ json_extract_scalar('_airbyte_data', ['Gumming4'], ['Gumming4']) }} as gumming4,
    {{ json_extract_scalar('_airbyte_data', ['LowVoltage7DateTime'], ['LowVoltage7DateTime']) }} as lowvoltage7datetime,
    {{ json_extract_scalar('_airbyte_data', ['HighVoltage8DateTime'], ['HighVoltage8DateTime']) }} as highvoltage8datetime,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_allflow') }} as table_alias
-- data_allflow
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

