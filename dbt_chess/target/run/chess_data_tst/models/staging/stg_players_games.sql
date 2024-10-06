
  
    

    create or replace table `dlthub-sandbox`.`chess_data_tst_transformed`.`stg_players_games`
      
    
    

    OPTIONS()
    as (
      /* Table: players_games */


-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids`

SELECT
/* select which columns will be available for table 'players_games' */
    end_time,
    url,
    pgn,
    time_control,
    rated,
    tcn,
    uuid,
    initial_setup,
    fen,
    time_class,
    rules,
    white__rating,
    white__result,
    white__aid,
    white__username,
    white__uuid,
    black__rating,
    black__result,
    black__aid,
    black__username,
    black__uuid,
    eco,
    _dlt_load_id,
    _dlt_id,
    accuracies__white,
    accuracies__black,
    start_time,
    tournament,
    match,
FROM `dlthub-sandbox`.`chess_data_tst`.`players_games`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids` )
    );
  