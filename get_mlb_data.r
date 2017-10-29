# Suited for retrosheet data GL

get_mlb_data <- function(dataName)
{
  # Original Data ----------------------------------------------------------
  
  ds <- read.csv(dataName)
  cols <- c(
    "Date", # Date
    "GN", # Game Number
    "WD", # Day of the week
    "VT", # Visiting Team
    "VTL", # Visiting Team League
    "VTGN", # Visiting Team Game Number
    "HT", # Home Team
    "HTL", # Home Team League
    "HTGN", # Home Team Game Number
    "VS", # Visiting Score
    "HS", # Home Score
    "GLO", # Length of the game in outs
    "DN", # Day/Night indicator
    "CInfo", # Completion information
    "FInfo", # Forfeit information
    "PInfo", # Protest information
    "PId", # Park id
    "Attn", # Attendance
    "GTm", # Game Time in minutes
    "VLS", # Visiting line score (001110001)
    "HLS", # Home line score
    # Visiting Offensive Stats
    "VatB", # Visiting at Bat times
    "V1B", # Visiting Hits
    "V2B", # Visiting Doubles
    "V3B", # Visiting Triples
    "VHr", # Visiting Homeruns
    "VRBI", # Visiting Run Batted In (RBI)
    "VSH", # Visiting Sacrifice Hits
    "VSF", # Visiting Sacrifice Flies
    "VHP", # Visiting Hit by Pitch
    "VW", # Visiting Walks
    "VIW", # Visiting Intentional Walks
    "VSO", # Visiting Strike Outs
    "VSB", # Visiting Stolen Bases
    "VCS", # Visiting Caught Stealing
    "VGDP", # Visiting grounded in Double Plays
    "VAFCI", # Visiting awarded first on catcher's interference
    "VLB", # Visiting left on base
    # Visiting Pitching Stats
    "VPU", # Visiting pitchers used ( 1 means it was a complete game )
    "VIER", # Visiting individual earned runs
    "VTER", # Visiting team earned runs
    "VWP", # Visiting wild pitches
    "VB", # Visiting balks
    # Visiting team defensive statistics
    "VPO", # Visiting putouts
    "VA", # Visiting assists
    "VE", # Visiting errors
    "VPB", # Visiting passed balls
    "vDP", # Visiting double plays
    "VTP", # Visiting triple plays
    # Home Offensive Stats
    "HatB", # Home at Bat times
    "H1B", # Home Hits
    "H2B", # Home Doubles
    "H3B", # Home Triples
    "HHr", # Home Homeruns
    "HRBI", # Home Run Batted In (RBI)
    "HSH", # Home Sacrifice Hits
    "HSF", # Home Sacrifice Flies
    "HHP", # Home Hit by Pitch
    "HW", # Home Walks
    "HIW", # Home Intentional Walks
    "HSO", # Home Strike Outs
    "HSB", # Home Stolen Bases
    "HCS", # Home Caught Stealing
    "HGDP", # Home grounded in Double Plays
    "HAFCI", # Home awarded first on catcher's interference
    "HLB", # Home left on base
    # Home Pitching Stats
    "HPU", # Home pitchers used ( 1 means it was a complete game )
    "HIER", # Home individual earned runs
    "HTER", # Home team earned runs
    "HWP", # Home wild pitches
    "HB", # Home balks
    # Home team defensive statistics
    "HPO", # Home putouts
    "HA", # Home assists
    "HE", # Home errors
    "HPB", # Home passed balls
    "HDP", # Home double plays
    "HTP", # Home triple plays
    "HPUId", # Home Plate Umpire ID
    "HPUName", # Home Plate Umpire Name
    "1BUId", # 1B umpire ID
    "1BUName", # 1B umpire name
    "2BUId", # 2B umpire ID
    "2BUName", # 2B umpire name
    "3BUId", # 3B umpire ID
    "3BUName", # 3B umpire name
    "LFUId", # LF umpire ID
    "LFUName", # LF umpire name
    "RFUId", # RF umpire ID
    "RFUName", # RF umpire name
    "VTMId", # Visiting team manager ID
    "VTMName", # Visiting team manager name
    "HTMId", # Home team manager ID
    "HTMName", # Home team manager name
    "WPId", # Winning pitcher ID
    "WPName", # Winning pitcher name
    "LPId", # Losing pitcher ID 
    "LPName", # Losing pitcher name
    "SPId", # Saving pitcher ID
    "SPName", # Saving pitcher name
    "GWRBIBId", # Game Winning RBI batter ID
    "GWRBIBName", # Game Winning RBI batter name
    "VSPId", # Visiting starting pitcher ID
    "VSPName", # Visiting starting pitcher name
    "HSPId", # Home starting pitcher ID
    "HSPName", # Home starting pitcher name
    "VP1Id", # Visiting starting player 1 Id
    "VP1Name", # Visiting starting player 1 Name
    "VP1DP", # Visiting starting player 1 Defensive Position
    "VP2Id", # Visiting starting player 2 Id
    "VP2Name", # Visiting starting player 2 Name
    "VP2DP", # Visiting starting player 2 Defensive Position
    "VP3Id", # Visiting starting player 3 Id
    "VP3Name", # Visiting starting player 3 Name
    "VP3DP", # Visiting starting player 3 Defensive Position
    "VP4Id", # Visiting starting player 4 Id
    "VP4Name", # Visiting starting player 4 Name
    "VP4DP", # Visiting starting player 4 Defensive Position
    "VP5Id", # Visiting starting player 5 Id
    "VP5Name", # Visiting starting player 5 Name
    "VP5DP", # Visiting starting player 5 Defensive Position
    "VP6Id", # Visiting starting player 6 Id
    "VP6Name", # Visiting starting player 6 Name
    "VP6DP", # Visiting starting player 6 Defensive Position
    "VP7Id", # Visiting starting player 7 Id
    "VP7Name", # Visiting starting player 7 Name
    "VP7DP", # Visiting starting player 7 Defensive Position
    "VP8Id", # Visiting starting player 8 Id
    "VP8Name", # Visiting starting player 8 Name
    "VP8DP", # Visiting starting player 8 Defensive Position
    "VP9Id", # Visiting starting player 9 Id
    "VP9Name", # Visiting starting player 9 Name
    "VP9DP", # Visiting starting player 9 Defensive Position
    "HP1Id", # Home starting player 1 Id
    "HP1Name", # Home starting player 1 Name
    "HP1DP", # Home starting player 1 Defensive Position
    "HP2Id", # Home starting player 2 Id
    "HP2Name", # Home starting player 2 Name
    "HP2DP", # Home starting player 2 Defensive Position
    "HP3Id", # Home starting player 3 Id
    "HP3Name", # Home starting player 3 Name
    "HP3DP", # Home starting player 3 Defensive Position
    "HP4Id", # Home starting player 4 Id
    "HP4Name", # Home starting player 4 Name
    "HP4DP", # Home starting player 4 Defensive Position
    "HP5Id", # Home starting player 5 Id
    "HP5Name", # Home starting player 5 Name
    "HP5DP", # Home starting player 5 Defensive Position
    "HP6Id", # Home starting player 6 Id
    "HP6Name", # Home starting player 6 Name
    "HP6DP", # Home starting player 6 Defensive Position
    "HP7Id", # Home starting player 7 Id
    "HP7Name", # Home starting player 7 Name
    "HP7DP", # Home starting player 7 Defensive Position
    "HP8Id", # Home starting player 8 Id
    "HP8Name", # Home starting player 8 Name
    "HP8DP", # Home starting player 8 Defensive Position
    "HP9Id", # Home starting player 9 Id
    "HP9Name", # Home starting player 9 Name
    "HP9DP", # Home starting player 9 Defensive Position
    "AddInfo", # Additional Information
    "ACQInfo"   # Acquisition information 
                # "Y" -- we have the complete game
                # "N" -- we don't have any portion of the game
                # "D" -- the game was derived from box score and game story
                # "P" -- we have some portion of the game.  We may be missing
                #        innings at the beginning, middle and end of the game.
    )
  
  colnames(ds) <- cols
  
  ds <- cbind(GAME_ID=paste(ds$HT,ds$Date,ds$GN,sep = ''), ds)
  ds <- ds[order(ds$GAME_ID),]
  
  # Original Data ----------------------------------------------------------
  
  # Selected Data ----------------------------------------------------------
  colsSelected <- c(
    "GAME_ID",
    "Date", # Date
    "VT", # Visiting Team
    "HT", # Home Team
    "VS", # Visiting Score
    "HS", # Home Score
    "FInfo", # Forfeit information
    # Visiting Offensive Stats
    "VatB", # Visiting at Bat times
    "V1B", # Visiting Hits
    "V2B", # Visiting Doubles
    "V3B", # Visiting Triples
    "VHr", # Visiting Homeruns
    "VRBI", # Visiting Run Batted In (RBI)
    "VSH", # Visiting Sacrifice Hits
    "VSF", # Visiting Sacrifice Flies
    "VHP", # Visiting Hit by Pitch
    "VW", # Visiting Walks
    "VIW", # Visiting Intentional Walks
    "VSO", # Visiting Strike Outs
    "VSB", # Visiting Stolen Bases
    "VCS", # Visiting Caught Stealing
    "VGDP", # Visiting grounded in Double Plays
    "VAFCI", # Visiting awarded first on catcher's interference
    "VLB", # Visiting left on base
    # Visiting Pitching Stats
    "VPU", # Visiting pitchers used ( 1 means it was a complete game )
    "VIER", # Visiting individual earned runs
    "VTER", # Visiting team earned runs
    "VWP", # Visiting wild pitches
    "VB", # Visiting balks
    # Visiting team defensive statistics
    "VPO", # Visiting putouts
    "VA", # Visiting assists
    "VE", # Visiting errors
    "VPB", # Visiting passed balls
    "vDP", # Visiting double plays
    "VTP", # Visiting triple plays
    # Home Offensive Stats
    "HatB", # Home at Bat times
    "H1B", # Home Hits
    "H2B", # Home Doubles
    "H3B", # Home Triples
    "HHr", # Home Homeruns
    "HRBI", # Home Run Batted In (RBI)
    "HSH", # Home Sacrifice Hits
    "HSF", # Home Sacrifice Flies
    "HHP", # Home Hit by Pitch
    "HW", # Home Walks
    "HIW", # Home Intentional Walks
    "HSO", # Home Strike Outs
    "HSB", # Home Stolen Bases
    "HCS", # Home Caught Stealing
    "HGDP", # Home grounded in Double Plays
    "HAFCI", # Home awarded first on catcher's interference
    "HLB", # Home left on base
    # Home Pitching Stats
    "HPU", # Home pitchers used ( 1 means it was a complete game )
    "HIER", # Home individual earned runs
    "HTER", # Home team earned runs
    "HWP", # Home wild pitches
    "HB", # Home balks
    # Home team defensive statistics
    "HPO", # Home putouts
    "HA", # Home assists
    "HE", # Home errors
    "HPB", # Home passed balls
    "HDP", # Home double plays
    "HTP", # Home triple plays
    "ACQInfo"   # Acquisition information 
    # "Y" -- we have the complete game
    # "N" -- we don't have any portion of the game
    # "D" -- the game was derived from box score and game story
    # "P" -- we have some portion of the game.  We may be missing
    #        innings at the beginning, middle and end of the game.
  )
  dataSelected <- ds[colsSelected]
  
  ds <- subset(dataSelected, is.na(FInfo) && (ACQInfo == "Y" || ACQInfo == "D"))
  
  # Selected Data ----------------------------------------------------------
  # Separating data of teams  ----------------------------------------------
  visitingCols <- c(
    "GAME_ID",
    "Date", # Date
    "VT", # Visiting Team
    "VS", # Visiting Score
    # Visiting Offensive Stats
    "VatB", # Visiting at Bat times
    "V1B", # Visiting Hits
    "V2B", # Visiting Doubles
    "V3B", # Visiting Triples
    "VHr", # Visiting Homeruns
    "VRBI", # Visiting Run Batted In (RBI)
    "VSH", # Visiting Sacrifice Hits
    "VSF", # Visiting Sacrifice Flies
    "VHP", # Visiting Hit by Pitch
    "VW", # Visiting Walks
    "VIW", # Visiting Intentional Walks
    "VSO", # Visiting Strike Outs
    "VSB", # Visiting Stolen Bases
    "VCS", # Visiting Caught Stealing
    "VGDP", # Visiting grounded in Double Plays
    "VAFCI", # Visiting awarded first on catcher's interference
    "VLB", # Visiting left on base
    # Visiting Pitching Stats
    "VPU", # Visiting pitchers used ( 1 means it was a complete game )
    "VIER", # Visiting individual earned runs
    "VTER", # Visiting team earned runs
    "VWP", # Visiting wild pitches
    "VB", # Visiting balks
    # Visiting team defensive statistics
    "VPO", # Visiting putouts
    "VA", # Visiting assists
    "VE", # Visiting errors
    "VPB", # Visiting passed balls
    "vDP", # Visiting double plays
    "VTP" # Visiting triple plays
  )
  
  homeCols <- c(
    "GAME_ID",
    "Date", # Date
    "HT", # Home Team
    "HS", # Home Score
    # Home Offensive Stats
    "HatB", # Home at Bat times
    "H1B", # Home Hits
    "H2B", # Home Doubles
    "H3B", # Home Triples
    "HHr", # Home Homeruns
    "HRBI", # Home Run Batted In (RBI)
    "HSH", # Home Sacrifice Hits
    "HSF", # Home Sacrifice Flies
    "HHP", # Home Hit by Pitch
    "HW", # Home Walks
    "HIW", # Home Intentional Walks
    "HSO", # Home Strike Outs
    "HSB", # Home Stolen Bases
    "HCS", # Home Caught Stealing
    "HGDP", # Home grounded in Double Plays
    "HAFCI", # Home awarded first on catcher's interference
    "HLB", # Home left on base
    # Home Pitching Stats
    "HPU", # Home pitchers used ( 1 means it was a complete game )
    "HIER", # Home individual earned runs
    "HTER", # Home team earned runs
    "HWP", # Home wild pitches
    "HB", # Home balks
    # Home team defensive statistics
    "HPO", # Home putouts
    "HA", # Home assists
    "HE", # Home errors
    "HPB", # Home passed balls
    "HDP", # Home double plays
    "HTP" # Home triple plays
  )
  
  visitingCols <- c(
    "GAME_ID",
    "Date", # Date
    "VT", # Visiting Team
    "VS", # Visiting Score
    # Visiting Offensive Stats
    "VatB", # Visiting at Bat times
    "V1B", # Visiting Hits
    "V2B", # Visiting Doubles
    "V3B", # Visiting Triples
    "VHr", # Visiting Homeruns
    "VRBI", # Visiting Run Batted In (RBI)
    "VSH", # Visiting Sacrifice Hits
    "VSF", # Visiting Sacrifice Flies
    "VHP", # Visiting Hit by Pitch
    "VW", # Visiting Walks
    "VIW", # Visiting Intentional Walks
    "VSO", # Visiting Strike Outs
    "VSB", # Visiting Stolen Bases
    "VCS", # Visiting Caught Stealing
    "VGDP", # Visiting grounded in Double Plays
    "VAFCI", # Visiting awarded first on catcher's interference
    "VLB", # Visiting left on base
    # Visiting Pitching Stats
    "VPU", # Visiting pitchers used ( 1 means it was a complete game )
    "VIER", # Visiting individual earned runs
    "VTER", # Visiting team earned runs
    "VWP", # Visiting wild pitches
    "VB", # Visiting balks
    # Visiting team defensive statistics
    "VPO", # Visiting putouts
    "VA", # Visiting assists
    "VE", # Visiting errors
    "VPB", # Visiting passed balls
    "vDP", # Visiting double plays
    "VTP" # Visiting triple plays
  )
  
  genCols <- c(
    "GAME_ID",
    "Date", # Date
    "Team", # Team
    "Score", # Score
    # Offensive Stats
    "AtB", # at Bat times
    "1B", # Hits
    "2B", # Doubles
    "3B", # Triples
    "Hr", # Homeruns
    "RBI", # Run Batted In (RBI)
    "SH", # Sacrifice Hits
    "SF", # Sacrifice Flies
    "HP", # Hit by Pitch
    "W", # Walks
    "IW", # Intentional Walks
    "SO", # Strike Outs
    "SB", # Stolen Bases
    "CS", # Caught Stealing
    "GDP", # grounded in Double Plays
    "AFCI", # awarded first on catcher's interference
    "LB", # left on base
    # Pitching Stats
    "PU", # pitchers used ( 1 means it was a complete game )
    "IER", # individual earned runs
    "TER", # team earned runs
    "WP", # wild pitches
    "B", # balks
    # team defensive statistics
    "PO", # putouts
    "A", # assists
    "E", # errors
    "PB", # passed balls
    "DP", # double plays
    "TP" # triple plays
  )
  
  dsVisiting <- ds[visitingCols]
  dsHome <- ds[homeCols]
  colnames(dsVisiting) <- genCols
  colnames(dsHome) <- genCols
  
  dsGen <- rbind(dsVisiting, dsHome)
  # Separating data of teams  ----------------------------------------------
  return(dsGen)
}
