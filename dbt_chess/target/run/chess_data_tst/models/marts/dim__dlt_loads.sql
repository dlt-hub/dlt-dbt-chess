-- back compat for old kwarg name
  
  
        
    

    

    merge into `dlthub-sandbox`.`chess_data_tst_transformed`.`dim__dlt_loads` as DBT_INTERNAL_DEST
        using (/* Table: _dlt_loads */

/* Description: Created by DLT. Tracks completed loads */
SELECT
    t.load_id,
    t.schema_name,
    t.status,
    t.inserted_at,
    t.schema_version_hash,
FROM  `dlthub-sandbox`.`chess_data_tst_transformed`.`stg__dlt_loads` as t
        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`load_id`, `schema_name`, `status`, `inserted_at`, `schema_version_hash`)
    values
        (`load_id`, `schema_name`, `status`, `inserted_at`, `schema_version_hash`)


    