{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_waveweld_ab1') }}
select
    cast(amplitude as {{ dbt_utils.type_string() }}(1024)) as amplitude,
    cast(uloperator as {{ dbt_utils.type_string() }}(1024)) as uloperator,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(accumulatedenergy as {{ dbt_utils.type_string() }}(1024)) as accumulatedenergy,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast({{ adapter.quote('Time') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Time') }},
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(flyline as {{ dbt_utils.type_string() }}(1024)) as flyline,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(pressure as {{ dbt_utils.type_string() }}(1024)) as pressure,
    cast(result as {{ dbt_utils.type_string() }}(1024)) as result,
    cast(resultsingle as {{ dbt_utils.type_string() }}(1024)) as resultsingle,
    cast(enddatetime as {{ dbt_utils.type_string() }}(1024)) as enddatetime,
    cast(operator_ as {{ dbt_utils.type_string() }}(1024)) as operator_,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(maxpower as {{ dbt_utils.type_string() }}(1024)) as maxpower,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(lineorder as {{ dbt_utils.type_string() }}(1024)) as lineorder,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_waveweld_ab1') }}
-- data_waveweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

