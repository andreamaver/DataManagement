#PLAYLIST 2021
playlist <- get_playlist_tracks('1LTOhruVYvdjY7WEAS5FBZ')
ids_artist <- {}

for (i in 1:nrow(playlist)){
  temp <- playlist[[9]][[i]]
  for (j in 1:nrow(temp)){
    ids_artist <- append(ids_artist, temp$id[j])
  }
}

artisti2021 <- get_artists(ids_artist)

artisti2021 <- artisti2021 %>% 
  add_column(edizione = 2021)

artisti2021 <- artisti2021 %>% distinct()