{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('packagecodetable_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_ab_cdc_event_serial_no',
        '_ab_cdc_updated_at',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'id',
        'packagecode',
        '_ab_cdc_cursor',
        adapter.quote('DateTime'),
    ]) }} as _airbyte_packagecodetable_hashid,
    tmp.*
from {{ ref('packagecodetable_ab2') }} tmp
-- packagecodetable
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

