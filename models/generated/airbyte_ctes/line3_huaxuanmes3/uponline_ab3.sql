{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('uponline_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'uponlinetypename',
        '_ab_cdc_event_serial_no',
        'dznum',
        '_ab_cdc_updated_at',
        '_ab_cdc_deleted_at',
        'uponlineid',
        '_ab_cdc_lsn',
        'sgjnum',
        '_ab_cdc_cursor',
        'xgjnum',
    ]) }} as _airbyte_uponline_hashid,
    tmp.*
from {{ ref('uponline_ab2') }} tmp
-- uponline
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

