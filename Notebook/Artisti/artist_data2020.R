#PLAYLIST 2020
playlist <- get_playlist_tracks('7jTAoDMIpkHTDOnBJxbNeA')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2020 <- get_artists(ids_artist)

artisti2020 <- artisti2020 %>% 
  add_column(edizione = 2020)

artisti2020 <- artisti2020 %>% distinct()