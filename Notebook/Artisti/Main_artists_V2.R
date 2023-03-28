rm(list=ls())

#### LIBRARIES ####
library(spotifyr)
library(tidyverse)
library(knitr)
library(xlsx)

#### DIRECTORIES ####
working_dir = "###"
setwd(working_dir)

Sys.setenv(SPOTIFY_CLIENT_ID = '###')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '###')

access_token <- get_spotify_access_token()

#### EXECUTION FULL PIPELINE ####
PIPELINE_scripts <- c(
  'artist_data2013.R',
  'artist_data2014.R',
  'artist_data2015.R',
  'artist_data2016.R',
  'artist_data2017.R',
  'artist_data2018.R',
  'artist_data2019.R',
  'artist_data2020.R',
  'artist_data2021.R',
  'artist_data2022.R'
)

for(i in PIPELINE_scripts){
  source(i, echo = TRUE)
}

artisti_final <- rbind(artisti2013, artisti2014, artisti2015,
                       artisti2016, artisti2017, artisti2018,
                       artisti2019, artisti2020, artisti2021, artisti2022)

artisti_final <- artisti_final %>% 
  rename(id_artist = id) %>%
  rename(edition = edizione)

generi<-data.frame(artisti_final)

artisti_final <- artisti_final %>%
 select(3, 5, 12)

generi <- generi%>%
  select(1, 3)

generi <- generi %>% 
  mutate(genres = sapply(genres, toString))

write.csv(artisti_final, file = '###', row.names=FALSE)
write.csv(generi, file = '###', row.names=FALSE)
