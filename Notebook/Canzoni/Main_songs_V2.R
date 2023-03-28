rm(list=ls())

#### LIBRARIES ####
library(spotifyr)
library(tidyverse)
library(knitr)
library(WikidataQueryServiceR)
library(WikidataR)
library(xlsx)

#### DIRECTORIES ####
working_dir = "###"
setwd(working_dir)

Sys.setenv(SPOTIFY_CLIENT_ID = '###')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '###')

access_token <- get_spotify_access_token()

#### EXECUTION FULL PIPELINE ####
PIPELINE_scripts <- c(
  'tracks_data2013_V2.R',
  'tracks_data2014_V2.R',
  'tracks_data2015_V2.R',
  'tracks_data2016_V2.R',
  'tracks_data2017_V2.R',
  'tracks_data2018_V2.R',
  'tracks_data2019_V2.R',
  'tracks_data2020_V2.R',
  'tracks_data2021_V2.R',
  'tracks_data2022_V2.R'
)

for(i in PIPELINE_scripts){
  source(i, echo = TRUE)
}

# creazione tabella completa di tutte le edizioni
tracce_final <- rbind(tracce2013, tracce2014, tracce2015,
                      tracce2016, tracce2017, tracce2018,
                      tracce2019, tracce2020, tracce2021, tracce2022)

# selezione colonne utili
tracce_final <- tracce_final %>%
  select(5, 7,9, 30:40, 45:47)

tracce_final <- tracce_final %>%
  select(1:9, 13:17)

# rinomina
tracce_final <- tracce_final %>% 
   rename(durata = duration_ms.y) %>%
   rename(id_track = id) %>%
   rename(titolo = name) %>%
   rename(chiave = key) %>%
  rename(esplicita= explicit) %>%
  rename(ballabilità = danceability) %>%
  rename(energia = energy) %>%
  rename(rumorosità = loudness) %>%
  rename(tonalità  = mode ) %>%
  rename(parlato   = speechiness ) %>%
  rename(positività  = valence ) %>%
  rename(ritmo = time_signature)

# cambio formato durata, da millisecondi a minuti
tracce_final$durata <- (tracce_final$durata)/60000
tracce_final$durata <- round(tracce_final$durata, digit=2)

# approssimazione tempo
tracce_final$tempo <- round(tracce_final$tempo, digit=0)

# cambio formato scala
tracce_final$tonalità[tracce_final$tonalità == "0"] <- 'minore'
tracce_final$tonalità[tracce_final$tonalità == "1"] <- 'maggiore'



write.csv(tracce_final, file = '###', row.names=FALSE)

