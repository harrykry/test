{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_highvoltage_ab3') }}
select
    abresistance,
    typename,
    _ab_cdc_event_serial_no,
    _ab_cdc_deleted_at,
    bcresistance,
    result,
    xtvoltage,
    enddatetime,
    xtvoltageres,
    id,
    balanceresistance,
    acinterturn,
    bcvoltage,
    acvoltage,
    acvoltageres,
    acresistance,
    linemode,
    abvoltage,
    _ab_cdc_lsn,
    {{ adapter.quote('Code') }},
    bcvoltageres,
    startdatetime,
    bcinterturn,
    abinterturn,
    abvoltageres,
    _ab_cdc_updated_at,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_highvoltage_hashid
from {{ ref('data_highvoltage_ab3') }}
-- data_highvoltage from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_highvoltage') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

