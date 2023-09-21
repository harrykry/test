{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('data_stationnum_ab1') }}
select
    cast(numhighvoltage as {{ dbt_utils.type_bigint() }}) as numhighvoltage,
    cast(numok as {{ dbt_utils.type_bigint() }}) as numok,
    cast(numlasterengraving as {{ dbt_utils.type_bigint() }}) as numlasterengraving,
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(numtigweld as {{ dbt_utils.type_bigint() }}) as numtigweld,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(datetimestring as {{ dbt_utils.type_string() }}(1024)) as datetimestring,
    cast(numintotunnelstove as {{ dbt_utils.type_bigint() }}) as numintotunnelstove,
    cast(numreellineleft as {{ dbt_utils.type_bigint() }}) as numreellineleft,
    cast(numgumming as {{ dbt_utils.type_bigint() }}) as numgumming,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(numresistance as {{ dbt_utils.type_bigint() }}) as numresistance,
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(numplan as {{ dbt_utils.type_bigint() }}) as numplan,
    cast(numwaveweld2 as {{ dbt_utils.type_bigint() }}) as numwaveweld2,
    cast(numlowvoltage as {{ dbt_utils.type_bigint() }}) as numlowvoltage,
    cast(numreellineright as {{ dbt_utils.type_bigint() }}) as numreellineright,
    cast(numwaveweld1 as {{ dbt_utils.type_bigint() }}) as numwaveweld1,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(numgp12 as {{ dbt_utils.type_bigint() }}) as numgp12,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('data_stationnum_ab1') }}
-- data_stationnum
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

