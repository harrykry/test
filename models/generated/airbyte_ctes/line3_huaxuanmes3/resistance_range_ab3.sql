{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('resistance_range_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'min',
        '_ab_cdc_event_serial_no',
        'max',
        'typename',
        '_ab_cdc_updated_at',
        '_ab_cdc_deleted_at',
        '_ab_cdc_lsn',
        'id',
        '_ab_cdc_cursor',
        'plcid',
    ]) }} as _airbyte_resistance_range_hashid,
    tmp.*
from {{ ref('resistance_range_ab2') }} tmp
-- resistance_range
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

