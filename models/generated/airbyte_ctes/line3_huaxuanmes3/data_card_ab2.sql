{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_card_ab1') }}
select
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(station6 as {{ dbt_utils.type_string() }}(1024)) as station6,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(station4 as {{ dbt_utils.type_string() }}(1024)) as station4,
    cast(station5 as {{ dbt_utils.type_string() }}(1024)) as station5,
    cast(station2 as {{ dbt_utils.type_string() }}(1024)) as station2,
    cast(station3 as {{ dbt_utils.type_string() }}(1024)) as station3,
    cast(station1 as {{ dbt_utils.type_string() }}(1024)) as station1,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_card_ab1') }}
-- data_card
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

