{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_allflow_ab3') }}
select
    reelline1,
    _ab_cdc_event_serial_no,
    resistance3,
    _ab_cdc_deleted_at,
    _ab_cdc_lsn,
    lowvoltage7,
    {{ adapter.quote('Code') }},
    highvoltage8,
    gp1210,
    waveweld6,
    startdatetime,
    laserengraving9,
    enddatetime,
    tigweld2,
    tunnelstove5,
    _ab_cdc_updated_at,
    id,
    _ab_cdc_cursor,
    gumming4,
    lowvoltage7datetime,
    highvoltage8datetime,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_allflow_hashid
from {{ ref('data_allflow_ab3') }}
-- data_allflow from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_allflow') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

