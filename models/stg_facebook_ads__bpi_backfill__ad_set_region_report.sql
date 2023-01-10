{{ config(enabled=var('ad_reporting__facebook_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_facebook_ads__bpi_backfill__ad_set_region_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_facebook_ads__bpi_backfill__ad_set_region_report_tmp')),
                staging_columns=get_ad_set_region_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        "day" as date_day,
        campaign_name,
        ad_set_name,
        region,
        attribution_setting,
        starts as start_at,
        ends as end_at,
        impressions,
        amount_spent_usd as spend

        {{ fivetran_utils.fill_pass_through_columns('facebook_ads__basic_ad_passthrough_metrics') }}
    from fields
)

select * 
from final
