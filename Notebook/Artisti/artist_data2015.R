#PLAYLIST 2015
playlist <- get_playlist_tracks('7wAM2ATjE2Plh0AEMTPA7G')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2015 <- get_artists(ids_artist)

artisti2015 <- artisti2015 %>% 
  add_column(edizione = 2015)

artisti2015 <- artisti2015 %>% distinct()