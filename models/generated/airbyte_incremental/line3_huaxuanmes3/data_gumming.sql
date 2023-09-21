{{ config(
    unique_key = "_airbyte_unique_key",
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_gumming_scd') }}
select
    _airbyte_unique_key,
    tunnelstovetime,
    temperature,
    gummingenddatetime,
    _ab_cdc_event_serial_no,
    gummingresult,
    _ab_cdc_updated_at,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    id,
    {{ adapter.quote('Code') }},
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_gumming_hashid
from {{ ref('data_gumming_scd') }}
-- data_gumming from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_gumming') }}
where 1 = 1
and _airbyte_active_row = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

