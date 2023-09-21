{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_allflow_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'reelline1',
        '_ab_cdc_event_serial_no',
        'resistance3',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'lowvoltage7',
        adapter.quote('Code'),
        'highvoltage8',
        'gp1210',
        'waveweld6',
        'startdatetime',
        'laserengraving9',
        'enddatetime',
        'tigweld2',
        'tunnelstove5',
        '_ab_cdc_updated_at',
        'id',
        '_ab_cdc_cursor',
        'gumming4',
        'lowvoltage7datetime',
        'highvoltage8datetime',
    ]) }} as _airbyte_data_allflow_hashid,
    tmp.*
from {{ ref('data_allflow_ab2') }} tmp
-- data_allflow
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

