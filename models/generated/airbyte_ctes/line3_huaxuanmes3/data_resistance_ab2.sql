{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_resistance_ab1') }}
select
    cast(resistancedatetime as {{ dbt_utils.type_string() }}(1024)) as resistancedatetime,
    cast(temperature as {{ dbt_utils.type_string() }}(1024)) as temperature,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(resistancer12 as {{ dbt_utils.type_string() }}(1024)) as resistancer12,
    cast(resistancer34 as {{ dbt_utils.type_string() }}(1024)) as resistancer34,
    cast(resistancer56 as {{ dbt_utils.type_string() }}(1024)) as resistancer56,
    cast(resistanceresult as {{ dbt_utils.type_string() }}(1024)) as resistanceresult,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_resistance_ab1') }}
-- data_resistance
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

