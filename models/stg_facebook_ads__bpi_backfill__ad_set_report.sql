{{ config(enabled=var('ad_reporting__facebook_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_facebook_ads__bpi_backfill__ad_set_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_facebook_ads__bpi_backfill__ad_set_report_tmp')),
                staging_columns=get_ad_set_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        "day" as date_day,
        account_id,
        account_name,
        campaign_id,
        campaign_name,
        ad_set_id,
        ad_set_name,
        cast(null as date) as start_at,
        cast(null as date) as end_at,
        null as bid_strategy,
        cast(null as bigint) as daily_budget,
        cast(null as bigint) as budget_remaining,
        link_clicks as clicks,
        impressions,
        amount_spent_usd as spend

        {{ fivetran_utils.fill_pass_through_columns('facebook_ads__basic_ad_passthrough_metrics') }}
    from fields
)

select * 
from final
