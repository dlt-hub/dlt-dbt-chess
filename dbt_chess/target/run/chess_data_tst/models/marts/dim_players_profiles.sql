-- back compat for old kwarg name
  
  
        
    

    

    merge into `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles` as DBT_INTERNAL_DEST
        using (/* Table: players_profiles */

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
FROM  `dlthub-sandbox`.`chess_data_tst_transformed`.`stg_players_profiles` as t
        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`last_online`, `joined`, `avatar`, `player_id`, `aid`, `url`, `name`, `username`, `title`, `followers`, `country`, `location`, `status`, `is_streamer`, `verified`, `league`, `_dlt_load_id`, `_dlt_id`, `twitch_url`)
    values
        (`last_online`, `joined`, `avatar`, `player_id`, `aid`, `url`, `name`, `username`, `title`, `followers`, `country`, `location`, `status`, `is_streamer`, `verified`, `league`, `_dlt_load_id`, `_dlt_id`, `twitch_url`)


    