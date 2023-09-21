{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_tunnelstove') }}
select
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['EndDateTime'], ['EndDateTime']) }} as enddatetime,
    {{ json_extract_scalar('_airbyte_data', ['Temperature5'], ['Temperature5']) }} as temperature5,
    {{ json_extract_scalar('_airbyte_data', ['Temperature4'], ['Temperature4']) }} as temperature4,
    {{ json_extract_scalar('_airbyte_data', ['Temperature3'], ['Temperature3']) }} as temperature3,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['Temperature2'], ['Temperature2']) }} as temperature2,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['Temperature1'], ['Temperature1']) }} as temperature1,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_tunnelstove') }} as table_alias
-- data_tunnelstove
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

