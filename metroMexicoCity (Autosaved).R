#Statistical analysist of Mexico City's Metro
#Author Jose Gonzalez
#Website www.jose-gonzalez.org

## Load packages
library(ggplot2)
data(diamonds)
library(RColorBrewer)
library(foreign)
#Read data form excel
afluencia <- read.csv("afluencia.csv")
afluencia[1:10,]


#Bubble plot
radius <- sqrt( data$2012 / pi)
mycolor <- factor(afluencia$linea)
symbols(data$longitude, data$latitude, circles=radius, inches=0.1, fg=mycolor, bg="white", xlab="Longitude", ylab="Latitude")
text(data$longitude, data$latitude, data$estacion, cex=0.3)

names(afluencia)

## ggplot2
## Define palette
brewer.pal(11, "Paired")
mypalette<-brewer.pal(12,"Paired")
## Sort data
sort.afluencia <- afluencia[order(afluencia),]

#Define layer
ggplot() +
layer(
  data = afluencia, mapping = aes(x = longitude, y = latitude, colour=factor(linea)),
  geom = "point") 

#Equivalent code
#Declare factor
ff <- factor (afluencia$linea)
#Full map
r <- qplot(longitude, latitude, data = afluencia, size = X2012 ,  colour = factor(linea))
r #print map
rc <- qplot(longitude, latitude, data = afluencia, size = X2012, colour = ff)
rc # print map
cols <- c("1" = "violetred", "2" = "navyblue", "3" = "olivedrab", "4" = "turquoise", "5" = "yellow", "6" = "red", "7" = "orange", "8" = "aquamarine4", "9" = "wheat4", "A" = "blueviolet", "B" = "lightslategrey")
rc + scale_colour_manual(values = cols) + geom_text(aes(label = estacion), hjust=-0.1, vjust=0) 
#Map inset focus on Downtown
rc + scale_colour_manual(values = cols) + geom_text(aes(label = estacion), hjust=-0.1, vjust=0) + coord_cartesian(xlim=c(-99.15, -99.10), ylim=c(19.40, 19.45))

