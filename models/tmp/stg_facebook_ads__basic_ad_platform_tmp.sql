{{ config(enabled=var('ad_reporting__facebook_ads_enabled', True)) }}

select *
from {{ source('facebook_ads', 'basic_ad_platform') }}
