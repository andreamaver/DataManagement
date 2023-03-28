#playlist 2016
playlist <- get_playlist_tracks('3vNgLlUPHGssSBDVb5rRye') 
ids_tracks <- {}

for (i in 1:nrow(playlist)){
  ids_tracks <- append(ids_tracks, playlist$track.id[i])
}

#track
tracce <- get_tracks(ids_tracks)

artisti_canzoni_id2016 <- data.frame()

for (i in 1:nrow(tracce)){
  data_temp_artisti <- tracce[[1]][[i]]
  for (j in 1:nrow(data_temp_artisti)){
    data_temp_artisti$href[j] <- tracce$id[i]
  }
  artisti_canzoni_id2016 <- rbind(artisti_canzoni_id2016, data_temp_artisti)
}
