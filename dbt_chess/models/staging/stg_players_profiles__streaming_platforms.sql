/* Table: players_profiles__streaming_platforms */
/* Parent: { parent }} */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_players_profiles') }}

SELECT
/* select which columns will be available for table 'players_profiles__streaming_platforms' */
    type,
    channel_url,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'players_profiles__streaming_platforms') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_players_profiles') }} )
