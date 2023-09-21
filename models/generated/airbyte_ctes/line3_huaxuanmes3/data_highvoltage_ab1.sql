{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_line3_huaxuanmes3",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('line3_huaxuanmes3', '_airbyte_raw_data_highvoltage') }}
select
    {{ json_extract_scalar('_airbyte_data', ['ABResistance'], ['ABResistance']) }} as abresistance,
    {{ json_extract_scalar('_airbyte_data', ['TypeName'], ['TypeName']) }} as typename,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_event_serial_no'], ['_ab_cdc_event_serial_no']) }} as _ab_cdc_event_serial_no,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['BCResistance'], ['BCResistance']) }} as bcresistance,
    {{ json_extract_scalar('_airbyte_data', ['Result'], ['Result']) }} as result,
    {{ json_extract_scalar('_airbyte_data', ['XTVoltage'], ['XTVoltage']) }} as xtvoltage,
    {{ json_extract_scalar('_airbyte_data', ['EndDateTime'], ['EndDateTime']) }} as enddatetime,
    {{ json_extract_scalar('_airbyte_data', ['XTVoltageRes'], ['XTVoltageRes']) }} as xtvoltageres,
    {{ json_extract_scalar('_airbyte_data', ['ID'], ['ID']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['BalanceResistance'], ['BalanceResistance']) }} as balanceresistance,
    {{ json_extract_scalar('_airbyte_data', ['ACInterTurn'], ['ACInterTurn']) }} as acinterturn,
    {{ json_extract_scalar('_airbyte_data', ['BCVoltage'], ['BCVoltage']) }} as bcvoltage,
    {{ json_extract_scalar('_airbyte_data', ['ACVoltage'], ['ACVoltage']) }} as acvoltage,
    {{ json_extract_scalar('_airbyte_data', ['ACVoltageRes'], ['ACVoltageRes']) }} as acvoltageres,
    {{ json_extract_scalar('_airbyte_data', ['ACResistance'], ['ACResistance']) }} as acresistance,
    {{ json_extract_scalar('_airbyte_data', ['LineMode'], ['LineMode']) }} as linemode,
    {{ json_extract_scalar('_airbyte_data', ['ABVoltage'], ['ABVoltage']) }} as abvoltage,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['Code'], ['Code']) }} as {{ adapter.quote('Code') }},
    {{ json_extract_scalar('_airbyte_data', ['BCVoltageRes'], ['BCVoltageRes']) }} as bcvoltageres,
    {{ json_extract_scalar('_airbyte_data', ['StartDateTime'], ['StartDateTime']) }} as startdatetime,
    {{ json_extract_scalar('_airbyte_data', ['BCInterTurn'], ['BCInterTurn']) }} as bcinterturn,
    {{ json_extract_scalar('_airbyte_data', ['ABInterTurn'], ['ABInterTurn']) }} as abinterturn,
    {{ json_extract_scalar('_airbyte_data', ['ABVoltageRes'], ['ABVoltageRes']) }} as abvoltageres,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_cursor'], ['_ab_cdc_cursor']) }} as _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('line3_huaxuanmes3', '_airbyte_raw_data_highvoltage') }} as table_alias
-- data_highvoltage
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

