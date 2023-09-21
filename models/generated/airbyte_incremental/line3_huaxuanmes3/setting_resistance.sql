{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('setting_resistance_ab3') }}
select
    typename,
    min,
    _ab_cdc_event_serial_no,
    max,
    _ab_cdc_updated_at,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    id,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_setting_resistance_hashid
from {{ ref('setting_resistance_ab3') }}
-- setting_resistance from {{ source('line3_huaxuanmes3', '_airbyte_raw_setting_resistance') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

