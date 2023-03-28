#PLAYLIST 2019
playlist <- get_playlist_tracks('3Ul1YjNa2xS1mfmmCksHsa')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2019 <- get_artists(ids_artist)

artisti2019 <- artisti2019 %>% 
  add_column(edizione = 2019)

artisti2019 <- artisti2019 %>% distinct()