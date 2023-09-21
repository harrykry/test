{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('resistance_range_ab1') }}
select
    cast(min as {{ dbt_utils.type_string() }}(1024)) as min,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(max as {{ dbt_utils.type_string() }}(1024)) as max,
    cast(typename as {{ dbt_utils.type_string() }}(1024)) as typename,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(plcid as {{ dbt_utils.type_bigint() }}) as plcid,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('resistance_range_ab1') }}
-- resistance_range
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

