#PLAYLIST 2016
playlist <- get_playlist_tracks('3vNgLlUPHGssSBDVb5rRye')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2016 <- get_artists(ids_artist)

artisti2016 <- artisti2016 %>% 
  add_column(edizione = 2016)

artisti2016 <- artisti2016 %>% distinct()