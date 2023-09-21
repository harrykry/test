{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_resistance_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'resistancedatetime',
        'temperature',
        '_ab_cdc_event_serial_no',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        adapter.quote('Code'),
        '_ab_cdc_updated_at',
        'resistancer12',
        'resistancer34',
        'resistancer56',
        'resistanceresult',
        'id',
        '_ab_cdc_cursor',
    ]) }} as _airbyte_data_resistance_hashid,
    tmp.*
from {{ ref('data_resistance_ab2') }} tmp
-- data_resistance
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

