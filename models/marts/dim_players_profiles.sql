/* Table: players_profiles */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.last_online,
    t.joined,
    t.avatar,
    t.player_id,
    t.aid,
    t.url,
    t.name,
    t.username,
    t.title,
    t.followers,
    t.country,
    t.location,
    t.status,
    t.is_streamer,
    t.verified,
    t.league,
    t._dlt_load_id,
    t._dlt_id,
    t.twitch_url,
FROM  {{ ref('stg_players_profiles') }} as t