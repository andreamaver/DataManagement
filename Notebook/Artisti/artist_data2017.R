#PLAYLIST 2017
playlist <- get_playlist_tracks('1KCUJJiQoutMFpLcxdscmC')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2017 <- get_artists(ids_artist)

artisti2017 <- artisti2017 %>% 
  add_column(edizione = 2017)

artisti2017 <- artisti2017 %>% distinct()