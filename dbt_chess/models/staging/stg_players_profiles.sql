/* Table: players_profiles */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'players_profiles' */
    last_online,
    joined,
    avatar,
    player_id,
    aid,
    url,
    name,
    username,
    title,
    followers,
    country,
    location,
    status,
    is_streamer,
    verified,
    league,
    _dlt_load_id,
    _dlt_id,
    twitch_url,
FROM {{ source('raw_data', 'players_profiles') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )