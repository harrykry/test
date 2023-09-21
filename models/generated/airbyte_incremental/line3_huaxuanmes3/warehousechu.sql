{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('warehousechu_ab3') }}
select
    _ab_cdc_event_serial_no,
    position,
    vendor_code,
    num,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    typenumber,
    date_time,
    qrcode,
    {{ adapter.quote('Number') }},
    batch_number,
    _ab_cdc_updated_at,
    warehouse1id,
    _ab_cdc_cursor,
    po,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_warehousechu_hashid
from {{ ref('warehousechu_ab3') }}
-- warehousechu from {{ source('line3_huaxuanmes3', '_airbyte_raw_warehousechu') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

