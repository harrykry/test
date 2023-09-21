{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_highvoltage_ab1') }}
select
    cast(abresistance as {{ dbt_utils.type_string() }}(1024)) as abresistance,
    cast(typename as {{ dbt_utils.type_string() }}(1024)) as typename,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(bcresistance as {{ dbt_utils.type_string() }}(1024)) as bcresistance,
    cast(result as {{ dbt_utils.type_string() }}(1024)) as result,
    cast(xtvoltage as {{ dbt_utils.type_string() }}(1024)) as xtvoltage,
    cast(enddatetime as {{ dbt_utils.type_string() }}(1024)) as enddatetime,
    cast(xtvoltageres as {{ dbt_utils.type_string() }}(1024)) as xtvoltageres,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(balanceresistance as {{ dbt_utils.type_string() }}(1024)) as balanceresistance,
    cast(acinterturn as {{ dbt_utils.type_string() }}(1024)) as acinterturn,
    cast(bcvoltage as {{ dbt_utils.type_string() }}(1024)) as bcvoltage,
    cast(acvoltage as {{ dbt_utils.type_string() }}(1024)) as acvoltage,
    cast(acvoltageres as {{ dbt_utils.type_string() }}(1024)) as acvoltageres,
    cast(acresistance as {{ dbt_utils.type_string() }}(1024)) as acresistance,
    cast(linemode as {{ dbt_utils.type_string() }}(1024)) as linemode,
    cast(abvoltage as {{ dbt_utils.type_string() }}(1024)) as abvoltage,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast({{ adapter.quote('Code') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Code') }},
    cast(bcvoltageres as {{ dbt_utils.type_string() }}(1024)) as bcvoltageres,
    cast(startdatetime as {{ dbt_utils.type_string() }}(1024)) as startdatetime,
    cast(bcinterturn as {{ dbt_utils.type_string() }}(1024)) as bcinterturn,
    cast(abinterturn as {{ dbt_utils.type_string() }}(1024)) as abinterturn,
    cast(abvoltageres as {{ dbt_utils.type_string() }}(1024)) as abvoltageres,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_highvoltage_ab1') }}
-- data_highvoltage
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

