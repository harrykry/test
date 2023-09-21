{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('warehousechu_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_ab_cdc_event_serial_no',
        'position',
        'vendor_code',
        'num',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'typenumber',
        'date_time',
        'qrcode',
        adapter.quote('Number'),
        'batch_number',
        '_ab_cdc_updated_at',
        'warehouse1id',
        '_ab_cdc_cursor',
        'po',
    ]) }} as _airbyte_warehousechu_hashid,
    tmp.*
from {{ ref('warehousechu_ab2') }} tmp
-- warehousechu
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

