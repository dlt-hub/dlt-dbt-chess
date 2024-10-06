
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim__dlt_loads`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`fact_players_games`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles__streaming_platforms`
/* we save all currently active load ids into the processed ids table */
select load_id, current_timestamp() as inserted_at FROM `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids`