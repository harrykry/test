{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('warehouse_ab1') }}
select
    cast(_ab_cdc_event_serial_no as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_event_serial_no,
    cast(position as {{ dbt_utils.type_string() }}(1024)) as position,
    cast(vendor_code as {{ dbt_utils.type_string() }}(1024)) as vendor_code,
    cast(num as {{ dbt_utils.type_string() }}(1024)) as num,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_deleted_at,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_lsn,
    cast(typenumber as {{ dbt_utils.type_string() }}(1024)) as typenumber,
    cast(warehouseid as {{ dbt_utils.type_bigint() }}) as warehouseid,
    cast(date_time as {{ dbt_utils.type_string() }}(1024)) as date_time,
    cast(qrcode as {{ dbt_utils.type_string() }}(1024)) as qrcode,
    cast({{ adapter.quote('Number') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('Number') }},
    cast(batch_number as {{ dbt_utils.type_string() }}(1024)) as batch_number,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}(1024)) as _ab_cdc_updated_at,
    cast(_ab_cdc_cursor as {{ dbt_utils.type_bigint() }}) as _ab_cdc_cursor,
    cast(stock as {{ dbt_utils.type_bigint() }}) as stock,
    cast(po as {{ dbt_utils.type_string() }}(1024)) as po,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('warehouse_ab1') }}
-- warehouse
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

