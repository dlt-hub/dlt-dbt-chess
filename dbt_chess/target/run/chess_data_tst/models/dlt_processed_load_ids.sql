-- back compat for old kwarg name
  
  
        
    

    

    merge into `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_processed_load_ids` as DBT_INTERNAL_DEST
        using (
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim__dlt_loads`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`fact_players_games`
-- depends_on: `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles__streaming_platforms`
/* we save all currently active load ids into the processed ids table */
select load_id, current_timestamp() as inserted_at FROM `dlthub-sandbox`.`chess_data_tst_transformed`.`dlt_active_load_ids`
        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`load_id`, `inserted_at`)
    values
        (`load_id`, `inserted_at`)


    