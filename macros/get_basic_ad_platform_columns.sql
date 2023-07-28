{% macro get_basic_ad_platform_columns() %}

{% set columns = [
    {"name": "ad_id", "datatype": dbt.type_string()},
    {"name": "ad_name", "datatype": dbt.type_string()},
    {"name": "adset_name", "datatype": dbt.type_string()},
    {"name": "date", "datatype": "date"},
    {"name": "account_id", "datatype": dbt.type_int()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "inline_link_clicks", "datatype": dbt.type_int()},
    {"name": "spend", "datatype": dbt.type_float()},
    {"name": "reach", "datatype": dbt.type_int()},
    {"name": "publisher_platform", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('facebook_ads__basic_ad_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
