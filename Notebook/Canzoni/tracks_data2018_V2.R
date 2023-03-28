#playlist 2018
playlist <- get_playlist_tracks('3JPfc0B6fmpIVqf2XAEwUN') 
ids_tracks <- {}

for (i in 1:nrow(playlist)){
  ids_tracks <- append(ids_tracks, playlist$track.id[i])
}

#creo dataset di tracce e di artisti, per poi fare join

#track
tracce <- get_tracks(ids_tracks)

#features
feature_tracce <- get_track_audio_features(ids_tracks)

tracce2018 <- left_join(tracce, feature_tracce,
                         by = c("id" = "id"))

tracce2018 <- tracce2018 %>% 
  add_column(edizione = 2018)