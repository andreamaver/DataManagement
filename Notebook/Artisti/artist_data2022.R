#PLAYLIST 2022
playlist <- get_playlist_tracks('2uYm0RUeUYUeLHMniFos8T')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2022 <- get_artists(ids_artist)

artisti2022 <- artisti2022 %>% 
  add_column(edizione = 2022)

artisti2022 <- artisti2022 %>% distinct()