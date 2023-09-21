{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_tunnelstove_ab1') }}
select
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(enddatetime as {{ dbt_utils.type_string() }}(1024)) as enddatetime,
    cast(temperature5 as {{ dbt_utils.type_string() }}(1024)) as temperature5,
    cast(temperature4 as {{ dbt_utils.type_string() }}(1024)) as temperature4,
    cast(temperature3 as {{ dbt_utils.type_string() }}(1024)) as temperature3,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(temperature2 as {{ dbt_utils.type_string() }}(1024)) as temperature2,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(temperature1 as {{ dbt_utils.type_string() }}(1024)) as temperature1,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_tunnelstove_ab1') }}
-- data_tunnelstove
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

