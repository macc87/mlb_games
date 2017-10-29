
data2010 <- get_mlb_data('data/retrosheet/GL2010.txt')
data2011 <- get_mlb_data('data/retrosheet/GL2011.txt')
data2012 <- get_mlb_data('data/retrosheet/GL2012.txt')
data2013 <- get_mlb_data('data/retrosheet/GL2013.txt')
data2014 <- get_mlb_data('data/retrosheet/GL2014.txt')
data2015 <- get_mlb_data('data/retrosheet/GL2015.txt')
data2016 <- get_mlb_data('data/retrosheet/GL2016.txt')

pbp2010 <- read.csv('data/andrewflowers_pbp/pbp_2010.csv')
pbp2011 <- read.csv('data/andrewflowers_pbp/pbp_2011.csv')
pbp2012 <- read.csv('data/andrewflowers_pbp/pbp_2012.csv')
pbp2013 <- read.csv('data/andrewflowers_pbp/pbp_2013.csv')
pbp2014 <- read.csv('data/andrewflowers_pbp/pbp_2014.csv')
pbp2015 <- read.csv('data/andrewflowers_pbp/pbp_2015.csv')

merge_pitchers_data <- function(ds, ds_pbp){
  pitchers <- data.frame()
  for(d in 1:nrow(ds)){
    game_id <- toString(ds[d,]$GAME_ID)
    team <- toString(ds[d,]$Team)
    p <- starting_pitcher(ds_pbp, game_id, team)
    pitchers <- rbind(pitchers, p)
  }
  dp <- merge(ds, pitchers)
  return(dp)
}

data2010 <- merge_pitchers_data(data2010, pbp2010)
data2011 <- merge_pitchers_data(data2011, pbp2011)
data2012 <- merge_pitchers_data(data2012, pbp2012)
data2013 <- merge_pitchers_data(data2013, pbp2013)
data2014 <- merge_pitchers_data(data2014, pbp2014)
data2015 <- merge_pitchers_data(data2015, pbp2015)

data10_15 <- rbind(data2010, data2011, data2012, data2013, data2014, data2015)

write.csv(data2010, "output/season_2010.csv")
write.csv(data2011, "output/season_2011.csv")
write.csv(data2012, "output/season_2012.csv")
write.csv(data2013, "output/season_2013.csv")
write.csv(data2014, "output/season_2014.csv")
write.csv(data2015, "output/season_2015.csv")
write.csv(data2016, "output/season_2016.csv")
write.csv(data10_15, "output/seasons_2010-2015.csv")