#PLAYLIST 2014
playlist <- get_playlist_tracks('5dh1OYKzWq1uCQ3yZquRPc')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2014 <- get_artists(ids_artist)

artisti2014 <- artisti2014 %>% 
  add_column(edizione = 2014)

artisti2014 <- artisti2014 %>% distinct()