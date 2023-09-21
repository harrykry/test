{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('pocode_ab1') }}
select
    cast(typename as {{ dbt_utils.type_string() }}(1024)) as typename,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    {{ cast_to_boolean('isall') }} as isall,
    cast(gjx as {{ dbt_utils.type_string() }}(1024)) as gjx,
    cast(gujs as {{ dbt_utils.type_string() }}(1024)) as gujs,
    cast(dz as {{ dbt_utils.type_string() }}(1024)) as dz,
    cast(pocodeid as {{ dbt_utils.type_bigint() }}) as pocodeid,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(xs as {{ dbt_utils.type_string() }}(1024)) as xs,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('pocode_ab1') }}
-- pocode
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

