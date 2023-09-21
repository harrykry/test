{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('warehouse_ab3') }}
select
    _ab_cdc_event_serial_no,
    position,
    vendor_code,
    num,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    typenumber,
    warehouseid,
    date_time,
    qrcode,
    {{ adapter.quote('Number') }},
    batch_number,
    _ab_cdc_updated_at,
    _ab_cdc_cursor,
    stock,
    po,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_warehouse_hashid
from {{ ref('warehouse_ab3') }}
-- warehouse from {{ source('line3_huaxuanmes3', '_airbyte_raw_warehouse') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

