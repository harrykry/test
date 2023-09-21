{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_lowvoltage_ab3') }}
select
    pp,
    wc10,
    _ab_cdc_event_serial_no,
    max,
    _ab_cdc_deleted_at,
    sine,
    low_voltagetime,
    result,
    zero_voltage,
    sinusoidal_phase_shift,
    l2sin,
    l4sin,
    id,
    input_resistance,
    l1,
    l2,
    l3,
    excitation1,
    l4,
    excitation2,
    wc4,
    phase_shift,
    _ab_cdc_lsn,
    wc8,
    {{ adapter.quote('Code') }},
    min,
    electrical_difference,
    l1sin,
    l3sin,
    _ab_cdc_updated_at,
    _ab_cdc_cursor,
    cosine,
    voltage_fluctuation_rate,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_lowvoltage_hashid
from {{ ref('data_lowvoltage_ab3') }}
-- data_lowvoltage from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_lowvoltage') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

