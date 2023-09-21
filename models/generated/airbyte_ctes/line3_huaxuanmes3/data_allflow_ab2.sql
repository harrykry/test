{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_allflow_ab1') }}
select
    cast(reelline1 as {{ dbt_utils.type_string() }}(1024)) as reelline1,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(resistance3 as {{ dbt_utils.type_string() }}(1024)) as resistance3,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(lowvoltage7 as {{ dbt_utils.type_string() }}(1024)) as lowvoltage7,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(highvoltage8 as {{ dbt_utils.type_string() }}(1024)) as highvoltage8,
    cast(gp1210 as {{ dbt_utils.type_string() }}(1024)) as gp1210,
    cast(waveweld6 as {{ dbt_utils.type_string() }}(1024)) as waveweld6,
    cast(startdatetime as {{ dbt_utils.type_string() }}(1024)) as startdatetime,
    cast(laserengraving9 as {{ dbt_utils.type_string() }}(1024)) as laserengraving9,
    cast(enddatetime as {{ dbt_utils.type_string() }}(1024)) as enddatetime,
    cast(tigweld2 as {{ dbt_utils.type_string() }}(1024)) as tigweld2,
    cast(tunnelstove5 as {{ dbt_utils.type_string() }}(1024)) as tunnelstove5,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(gumming4 as {{ dbt_utils.type_string() }}(1024)) as gumming4,
    cast(lowvoltage7datetime as {{ dbt_utils.type_string() }}(1024)) as lowvoltage7datetime,
    cast(highvoltage8datetime as {{ dbt_utils.type_string() }}(1024)) as highvoltage8datetime,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_allflow_ab1') }}
-- data_allflow
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

