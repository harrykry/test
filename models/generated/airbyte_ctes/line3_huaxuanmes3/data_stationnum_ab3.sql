{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_stationnum_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'numhighvoltage',
        'numok',
        'numlasterengraving',
        '_ab_cdc_event_serial_no',
        'numtigweld',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'datetimestring',
        'numintotunnelstove',
        'numreellineleft',
        'numgumming',
        '_ab_cdc_updated_at',
        'numresistance',
        'id',
        'numplan',
        'numwaveweld2',
        'numlowvoltage',
        'numreellineright',
        'numwaveweld1',
        '_ab_cdc_cursor',
        'numgp12',
    ]) }} as _airbyte_data_stationnum_hashid,
    tmp.*
from {{ ref('data_stationnum_ab2') }} tmp
-- data_stationnum
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

