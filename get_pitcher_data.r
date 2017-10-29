# Suited for pbp andrewsflowers data pbp_

starting_pitcher <- function(ds, game_id, team_id){
  ds_game <- subset(ds, ds$GAME_ID == game_id)
  ds_team <- subset(ds_game, ds_game$AWAY_TEAM_ID == team_id)
  is_home_team <- if(lengths(ds_team)['GAME_ID'] == 0) 1 else 0
  ds_pitcher_start <- subset(ds_game, 
                             ds_game$BAT_HOME_ID == is_home_team & 
                               ds_game$INN_CT == 1 &
                               ds_game$LEADOFF_FL)
  ds_pitcher_game <- subset(ds_game,
                            ds_game$PIT_ID == ds_pitcher_start$PIT_ID)
  pitcher_max_event_id <- max(ds_pitcher_game$EVENT_ID)
  
  ds_pitcher_last_entry <- subset(ds_pitcher_game,
                                  ds_pitcher_game$EVENT_ID == pitcher_max_event_id)
  retn <- c(
    game_id,
    team_id,
    toString(ds_pitcher_last_entry$PIT_ID),
    ds_pitcher_last_entry$INN_CT,
    3 * (ds_pitcher_last_entry$INN_CT - 1) + ds_pitcher_last_entry$OUTS_CT + ds_pitcher_last_entry$EVENT_OUTS_CT
  )
  retn <- rbind(retn)
  cols <- c('GAME_ID', 'Team', 'PITCH_ID', 'PITCH_INN_CT', 'PITCH_OUTS')
  colnames(retn) <- cols
  rownames(retn) <- NULL  
  
  return(retn)
}
