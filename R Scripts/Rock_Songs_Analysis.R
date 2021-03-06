rm(list=ls())
setwd('C:/DragonBallZ/git_Repo/Spotty_Tagger')

library(ggplot2)
library("Rtsne")
tracks = read.csv('RockMusicInfoNew.csv')


summary(tracks)

#colsList = c('acousticness','danceability', 'duration_ms', 'energy', 'instrumentalness', 'key','liveness', 'loudness', 'mode', 'speechiness', 'tempo','time_signature', 'valence')
colsList = c('acousticness','danceability', 'energy', 'instrumentalness', 'liveness', 'loudness', 'speechiness', 'tempo', 'valence')


tracksColFil = tracks[,colsList]

trackPCA = prcomp(tracksColFil,scale = TRUE)

plot(trackPCA)

pc1 = trackPCA$x[,1]
pc2 = trackPCA$x[,2]
pc3 = trackPCA$x[,3]
pc4 = trackPCA$x[,4]
pc5 = trackPCA$x[,5]
rockType = as.character(tracks[,'genre'])
df = data.frame(rockType,pc1,pc2,pc3,pc4,pc5)


ggplot(df, aes(pc1,pc2,color=rockType)) + geom_point() + geom_text(aes(label=tracks$track_name))

tracks2000 <- subset(tracks , tracks$genre=='2000sRock')
tracks70 <- subset(tracks , tracks$genre=='70sRock')

colsList = c('acousticness','danceability', 'energy', 'instrumentalness', 'liveness', 'loudness', 'speechiness', 'tempo', 'valence')
tracks2000 = tracks2000[,colsList]
tracks70 = tracks70[,colsList]

pc_tracks2000 <- prcomp(tracks2000,scale= TRUE,center = TRUE)
pc_tracks70 <- prcomp(tracks70,scale= TRUE,center = TRUE)

x11()
par(mfrow=c(1,2))
biplot(pc_tracks70)
biplot(pc_tracks2000)


pc_ex2 <- prcomp(tracksColFil,scale= TRUE)
biplot(pc_ex2)
#biplot(princomp(tracksColFil),choices=c(1,3))



