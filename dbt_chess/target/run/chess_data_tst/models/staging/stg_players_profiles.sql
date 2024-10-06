
  
    

    create or replace table `dlthub-sandbox`.`chess_data_tst_transformed`.`stg_players_profiles`
      
    
    

    OPTIONS()
    as (
      /* Table: players_profiles */


-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids`

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
FROM `dlthub-sandbox`.`chess_data_tst`.`players_profiles`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids` )
    );
  