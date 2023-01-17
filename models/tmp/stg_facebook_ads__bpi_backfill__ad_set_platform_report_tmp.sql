{{ config(enabled=var('ad_reporting__facebook_ads_enabled', True)) }}

select * 
from {{ var('bpi_backfill__ad_set_platform_report') }}
