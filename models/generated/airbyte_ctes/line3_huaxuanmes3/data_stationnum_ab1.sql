{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_stationnum') }}
select
    {{ json_extract_scalar('_airbyte_data', ['NumHighVoltage'], ['NumHighVoltage']) }} as numhighvoltage,
    {{ json_extract_scalar('_airbyte_data', ['NumOK'], ['NumOK']) }} as numok,
    {{ json_extract_scalar('_airbyte_data', ['NumLasterEngraving'], ['NumLasterEngraving']) }} as numlasterengraving,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['NumTigWeld'], ['NumTigWeld']) }} as numtigweld,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['DateTimeString'], ['DateTimeString']) }} as datetimestring,
    {{ json_extract_scalar('_airbyte_data', ['NumIntoTunnelStove'], ['NumIntoTunnelStove']) }} as numintotunnelstove,
    {{ json_extract_scalar('_airbyte_data', ['NumReelLineLeft'], ['NumReelLineLeft']) }} as numreellineleft,
    {{ json_extract_scalar('_airbyte_data', ['NumGumming'], ['NumGumming']) }} as numgumming,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['NumResistance'], ['NumResistance']) }} as numresistance,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['NumPlan'], ['NumPlan']) }} as numplan,
    {{ json_extract_scalar('_airbyte_data', ['NumWaveWeld2'], ['NumWaveWeld2']) }} as numwaveweld2,
    {{ json_extract_scalar('_airbyte_data', ['NumLowVoltage'], ['NumLowVoltage']) }} as numlowvoltage,
    {{ json_extract_scalar('_airbyte_data', ['NumReelLineRight'], ['NumReelLineRight']) }} as numreellineright,
    {{ json_extract_scalar('_airbyte_data', ['NumWaveWeld1'], ['NumWaveWeld1']) }} as numwaveweld1,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    {{ json_extract_scalar('_airbyte_data', ['NumGP12'], ['NumGP12']) }} as numgp12,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_stationnum') }} as table_alias
-- data_stationnum
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

