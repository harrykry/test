{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_usercard_ab3') }}
select
    username,
    _ab_cdc_event_serial_no,
    _ab_cdc_updated_at,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    id,
    cardid,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_usercard_hashid
from {{ ref('data_usercard_ab3') }}
-- data_usercard from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_usercard') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

