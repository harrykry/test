{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('setting_packagenum_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'settingnum',
        '_ab_cdc_event_serial_no',
        'num',
        '_ab_cdc_updated_at',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'id',
        '_ab_cdc_cursor',
    ]) }} as _airbyte_setting_packagenum_hashid,
    tmp.*
from {{ ref('setting_packagenum_ab2') }} tmp
-- setting_packagenum
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

