#playlist 2021
playlist <- get_playlist_tracks('1LTOhruVYvdjY7WEAS5FBZ') 
ids_tracks <- {}

for (i in 1:nrow(playlist)){
  ids_tracks <- append(ids_tracks, playlist$track.id[i])
}

#creo dataset di tracce e di artisti, per poi fare join

#track
tracce <- get_tracks(ids_tracks)

#features
feature_tracce <- get_track_audio_features(ids_tracks)

tracce2021 <- left_join(tracce, feature_tracce,
                         by = c("id" = "id"))

tracce2021 <- tracce2021 %>% 
  add_column(edizione = 2021)