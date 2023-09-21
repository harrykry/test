{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('uponline_ab3') }}
select
    uponlinetypename,
    _ab_cdc_event_serial_no,
    dznum,
    _ab_cdc_updated_at,
    _ab_cdc_deleted_at,
    uponlineid,
    _ab_cdc_lsn,
    sgjnum,
    _ab_cdc_cursor,
    xgjnum,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_uponline_hashid
from {{ ref('uponline_ab3') }}
-- uponline from {{ source('line3_huaxuanmes3', '_airbyte_raw_uponline') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

