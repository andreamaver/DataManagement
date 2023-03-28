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
  'pivot_data2013.R',
  'pivot_data2014.R',
  'pivot_data2015.R',
  'pivot_data2016.R',
  'pivot_data2017.R',
  'pivot_data2018.R',
  'pivot_data2019.R',
  'pivot_data2020.R',
  'pivot_data2021.R',
  'pivot_data2022.R'
)

for(i in PIPELINE_scripts){
  source(i, echo = TRUE)
}

pivot_final <- rbind(artisti_canzoni_id2013, artisti_canzoni_id2014, 
                       artisti_canzoni_id2015, artisti_canzoni_id2016,
                       artisti_canzoni_id2017, artisti_canzoni_id2018,
                       artisti_canzoni_id2019, artisti_canzoni_id2020,
                       artisti_canzoni_id2021, artisti_canzoni_id2022)

pivot_final <- pivot_final %>% 
  rename(id_artist = id) %>%
  rename(id_track = href) %>%
  select(1, 2)

write.csv(pivot_final, file = '###', row.names=FALSE)
