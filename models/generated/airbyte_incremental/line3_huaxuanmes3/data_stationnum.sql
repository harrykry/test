{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_stationnum_ab3') }}
select
    numhighvoltage,
    numok,
    numlasterengraving,
    _ab_cdc_event_serial_no,
    numtigweld,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    datetimestring,
    numintotunnelstove,
    numreellineleft,
    numgumming,
    _ab_cdc_updated_at,
    numresistance,
    id,
    numplan,
    numwaveweld2,
    numlowvoltage,
    numreellineright,
    numwaveweld1,
    _ab_cdc_cursor,
    numgp12,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_stationnum_hashid
from {{ ref('data_stationnum_ab3') }}
-- data_stationnum from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_stationnum') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

