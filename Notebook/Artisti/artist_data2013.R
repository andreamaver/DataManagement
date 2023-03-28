#PLAYLIST 2013
playlist <- get_playlist_tracks('2Ir8jvuvg6MORMOYnyGVg0')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2013 <- get_artists(ids_artist)

artisti2013 <- artisti2013 %>% 
  add_column(edizione = 2013)

artisti2013 <- artisti2013 %>% distinct()
