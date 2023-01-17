{% macro get_ad_set_report_columns() %}

{% set columns = [
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "account_name", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_string()},
    {"name": "campaign_name", "datatype": dbt_utils.type_string()},
    {"name": "ad_set_id", "datatype": dbt_utils.type_string()},
    {"name": "ad_set_name", "datatype": dbt_utils.type_string()},
    {"name": "day", "datatype": "date"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "link_clicks", "datatype": dbt_utils.type_int()},
    {"name": "amount_spent_usd", "datatype": dbt_utils.type_float()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('facebook_ads__basic_ad_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
