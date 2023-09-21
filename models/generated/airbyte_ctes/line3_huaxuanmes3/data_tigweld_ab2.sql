{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_tigweld_ab1') }}
select
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(tigsingleresult as {{ dbt_utils.type_string() }}(1024)) as tigsingleresult,
    cast(altitdeintercept as {{ dbt_utils.type_string() }}(1024)) as altitdeintercept,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(eccentricdistance as {{ dbt_utils.type_string() }}(1024)) as eccentricdistance,
    cast(tigaisle as {{ dbt_utils.type_string() }}(1024)) as tigaisle,
    cast(tigresult as {{ dbt_utils.type_string() }}(1024)) as tigresult,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(tigcurrent as {{ dbt_utils.type_string() }}(1024)) as tigcurrent,
    cast(tigtime as {{ dbt_utils.type_string() }}(1024)) as tigtime,
    cast(enddatetime as {{ dbt_utils.type_string() }}(1024)) as enddatetime,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(tigccdresult as {{ dbt_utils.type_string() }}(1024)) as tigccdresult,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(diameter as {{ dbt_utils.type_string() }}(1024)) as diameter,
    cast(distance as {{ dbt_utils.type_string() }}(1024)) as distance,
    cast(tigvolt as {{ dbt_utils.type_string() }}(1024)) as tigvolt,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_tigweld_ab1') }}
-- data_tigweld
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

