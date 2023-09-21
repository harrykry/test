{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "line3_huaxuanmes3",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('data_waveweld_ab3') }}
select
    amplitude,
    uloperator,
    _ab_cdc_event_serial_no,
    accumulatedenergy,
    _ab_cdc_deleted_at,
    {{ adapter.quote('Time') }},
    _ab_cdc_lsn,
    flyline,
    {{ adapter.quote('Code') }},
    pressure,
    result,
    resultsingle,
    enddatetime,
    operator_,
    _ab_cdc_updated_at,
    maxpower,
    id,
    lineorder,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_data_waveweld_hashid
from {{ ref('data_waveweld_ab3') }}
-- data_waveweld from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_waveweld') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

