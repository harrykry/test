{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_warehouse') }}
select
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['Position'], ['Position']) }} as position,
    {{ json_extract_scalar('_airbyte_data', ['Vendor_Code'], ['Vendor_Code']) }} as vendor_code,
    {{ json_extract_scalar('_airbyte_data', ['Num'], ['Num']) }} as num,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['TypeNumber'], ['TypeNumber']) }} as typenumber,
    {{ json_extract_scalar('_airbyte_data', ['WarehouseID'], ['WarehouseID']) }} as warehouseid,
    {{ json_extract_scalar('_airbyte_data', ['Date_Time'], ['Date_Time']) }} as date_time,
    {{ json_extract_scalar('_airbyte_data', ['QRCode'], ['QRCode']) }} as qrcode,
    {{ json_extract_scalar('_airbyte_data', ['Number'], ['Number']) }} as {{ adapter.quote('Number') }},
    {{ json_extract_scalar('_airbyte_data', ['Batch_Number'], ['Batch_Number']) }} as batch_number,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    {{ json_extract_scalar('_airbyte_data', ['Stock'], ['Stock']) }} as stock,
    {{ json_extract_scalar('_airbyte_data', ['PO'], ['PO']) }} as po,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_warehouse') }} as table_alias
-- warehouse
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

