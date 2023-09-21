{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_tigweld_ab3') }}
select
    _ab_cdc_event_serial_no,
    tigsingleresult,
    altitdeintercept,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    eccentricdistance,
    tigaisle,
    tigresult,
    {{ adapter.quote('Code') }},
    tigcurrent,
    tigtime,
    enddatetime,
    _ab_cdc_updated_at,
    tigccdresult,
    id,
    _ab_cdc_cursor,
    diameter,
    distance,
    tigvolt,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_tigweld_hashid
from {{ ref('data_tigweld_ab3') }}
-- data_tigweld from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_tigweld') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

