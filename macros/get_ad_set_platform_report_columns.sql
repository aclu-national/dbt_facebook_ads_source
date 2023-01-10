{% macro get_ad_set_platform_report_columns() %}

{% set columns = [
    {"name": "campaign_name", "datatype": dbt_utils.type_string()},
    {"name": "ad_set_name", "datatype": dbt_utils.type_string()},
    {"name": "platform", "datatype": dbt_utils.type_string()},
    {"name": "attribution_setting", "datatype": dbt_utils.type_string()},
    {"name": "day", "datatype": "date"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "amount_spent_usd", "datatype": dbt_utils.type_float()},
    {"name": "starts", "datatype": "date"},
    {"name": "ends", "datatype": "date"},
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('facebook_ads__basic_ad_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
