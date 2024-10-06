-- back compat for old kwarg name
  
  
        
    

    

    merge into `dlthub-sandbox`.`chess_data_tst_transformed`.`dim_players_profiles__streaming_platforms` as DBT_INTERNAL_DEST
        using (/* Table: players_profiles__streaming_platforms */
/* Parent: players_profiles */

SELECT
    t.type,
    t.channel_url,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  `dlthub-sandbox`.`chess_data_tst_transformed`.`stg_players_profiles__streaming_platforms` as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN `dlthub-sandbox`.`chess_data_tst_transformed`.`stg_players_profiles` as pt
ON (t._dlt_parent_id = pt._dlt_id)
        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`type`, `channel_url`, `_dlt_parent_id`, `_dlt_list_idx`, `_dlt_id`)
    values
        (`type`, `channel_url`, `_dlt_parent_id`, `_dlt_list_idx`, `_dlt_id`)


    