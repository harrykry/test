{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('pocode_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'typename',
        '_ab_cdc_event_serial_no',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        boolean_to_string('isall'),
        'gjx',
        'gujs',
        'dz',
        'pocodeid',
        '_ab_cdc_updated_at',
        'id',
        'xs',
        '_ab_cdc_cursor',
    ]) }} as _airbyte_pocode_hashid,
    tmp.*
from {{ ref('pocode_ab2') }} tmp
-- pocode
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

