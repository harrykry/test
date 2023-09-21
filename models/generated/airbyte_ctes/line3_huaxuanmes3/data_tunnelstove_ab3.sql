{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_tunnelstove_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_ab_cdc_event_serial_no',
        'enddatetime',
        'temperature5',
        'temperature4',
        'temperature3',
        '_ab_cdc_updated_at',
        'temperature2',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'temperature1',
        'id',
        '_ab_cdc_cursor',
    ]) }} as _airbyte_data_tunnelstove_hashid,
    tmp.*
from {{ ref('data_tunnelstove_ab2') }} tmp
-- data_tunnelstove
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

