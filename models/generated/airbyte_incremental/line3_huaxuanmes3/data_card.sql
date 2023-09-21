{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_card_ab3') }}
select
    _ab_cdc_event_serial_no,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    station6,
    {{ adapter.quote('Code') }},
    station4,
    station5,
    station2,
    station3,
    station1,
    _ab_cdc_updated_at,
    id,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_card_hashid
from {{ ref('data_card_ab3') }}
-- data_card from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_card') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

