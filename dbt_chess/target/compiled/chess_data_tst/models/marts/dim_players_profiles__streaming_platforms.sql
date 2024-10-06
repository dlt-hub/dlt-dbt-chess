/* Table: players_profiles__streaming_platforms */
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