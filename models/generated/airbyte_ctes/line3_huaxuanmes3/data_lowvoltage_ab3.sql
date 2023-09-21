{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('data_lowvoltage_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'pp',
        'wc10',
        '_ab_cdc_event_serial_no',
        'max',
        '_ab_cdc_deleted_at',
        'sine',
        'low_voltagetime',
        'result',
        'zero_voltage',
        'sinusoidal_phase_shift',
        'l2sin',
        'l4sin',
        'id',
        'input_resistance',
        'l1',
        'l2',
        'l3',
        'excitation1',
        'l4',
        'excitation2',
        'wc4',
        'phase_shift',
        '_ab_cdc_lsn',
        'wc8',
        adapter.quote('Code'),
        'min',
        'electrical_difference',
        'l1sin',
        'l3sin',
        '_ab_cdc_updated_at',
        '_ab_cdc_cursor',
        'cosine',
        'voltage_fluctuation_rate',
    ]) }} as _airbyte_data_lowvoltage_hashid,
    tmp.*
from {{ ref('data_lowvoltage_ab2') }} tmp
-- data_lowvoltage
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

