#PLAYLIST 2018
playlist <- get_playlist_tracks('3JPfc0B6fmpIVqf2XAEwUN')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2018 <- get_artists(ids_artist)

artisti2018 <- artisti2018 %>% 
  add_column(edizione = 2018)

artisti2018 <- artisti2018 %>% distinct()