{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_tigweld_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_ab_cdc_event_serial_no',
        'tigsingleresult',
        'altitdeintercept',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'eccentricdistance',
        'tigaisle',
        'tigresult',
        adapter.quote('Code'),
        'tigcurrent',
        'tigtime',
        'enddatetime',
        '_ab_cdc_updated_at',
        'tigccdresult',
        'id',
        '_ab_cdc_cursor',
        'diameter',
        'distance',
        'tigvolt',
    ]) }} as _airbyte_data_tigweld_hashid,
    tmp.*
from {{ ref('data_tigweld_ab2') }} tmp
-- data_tigweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

