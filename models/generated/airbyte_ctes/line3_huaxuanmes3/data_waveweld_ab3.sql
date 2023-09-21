{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_waveweld_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'amplitude',
        'uloperator',
        '_ab_cdc_event_serial_no',
        'accumulatedenergy',
        '_ab_cdc_deleted_at',
        adapter.quote('Time'),
        '_ab_cdc_lsn',
        'flyline',
        adapter.quote('Code'),
        'pressure',
        'result',
        'resultsingle',
        'enddatetime',
        'operator_',
        '_ab_cdc_updated_at',
        'maxpower',
        'id',
        'lineorder',
        '_ab_cdc_cursor',
    ]) }} as _airbyte_data_waveweld_hashid,
    tmp.*
from {{ ref('data_waveweld_ab2') }} tmp
-- data_waveweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

