/* Fact Table: players_games */
{{
    config(
        materialized='incremental'
    )
}}

SELECT
    ---- main table players_games
    players_games._dlt_id,
    players_games.end_time,
    players_games.url,
    players_games.pgn,
    players_games.time_control,
    players_games.rated,
    players_games.tcn,
    players_games.uuid,
    players_games.initial_setup,
    players_games.fen,
    players_games.time_class,
    players_games.rules,
    players_games.white__rating,
    players_games.white__result,
    players_games.white__aid,
    players_games.white__username,
    players_games.white__uuid,
    players_games.black__rating,
    players_games.black__result,
    players_games.black__aid,
    players_games.black__username,
    players_games.black__uuid,
    players_games.eco,
    players_games.accuracies__white,
    players_games.accuracies__black,
    players_games.start_time,
    players_games.tournament,
    players_games.match,

    

FROM  {{ ref('stg_players_games') }} as players_games