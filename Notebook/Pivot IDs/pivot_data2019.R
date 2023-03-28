#playlist 2019
playlist <- get_playlist_tracks('3Ul1YjNa2xS1mfmmCksHsa') 
ids_tracks <- {}

for (i in 1:nrow(playlist)){
  ids_tracks <- append(ids_tracks, playlist$track.id[i])
}

#track
tracce <- get_tracks(ids_tracks)

artisti_canzoni_id2019 <- data.frame()

for (i in 1:nrow(tracce)){
  data_temp_artisti <- tracce[[1]][[i]]
  for (j in 1:nrow(data_temp_artisti)){
    data_temp_artisti$href[j] <- tracce$id[i]
  }
  artisti_canzoni_id2019 <- rbind(artisti_canzoni_id2019, data_temp_artisti)
}
