{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('pocode_ab3') }}
select
    typename,
    _ab_cdc_event_serial_no,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    isall,
    gjx,
    gujs,
    dz,
    pocodeid,
    _ab_cdc_updated_at,
    id,
    xs,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_pocode_hashid
from {{ ref('pocode_ab3') }}
-- pocode from {{ source('line3_huaxuanmes3', '_airbyte_raw_pocode') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

