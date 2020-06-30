#devtools::install_github('UrbanInstitute/urbnmapr')


#Create list of required packages
list.of.packages <- c('purrr', 'readr', 'dplyr', 'sf', 'urbnmapr')
new.packages <- list.of.packages[!(list.of.packages %in% utils::installed.packages()[,"Package"])]

#Install missing packages
if(length(new.packages)) install.packages(new.packages)

#Load packages
library('readr')
library('dplyr')
library('purrr')
library('sf')
library('urbnmapr')


#Clear out environment variables
rm(list=ls())

#Set random seed
set.seed(1738)

#clear Plots pane
if(!is.null(dev.list())) dev.off() 




datafile_name <- 'chicago-public-schools-middle-school-attendance-boundaries-sy1920-1.csv'
data <- utils::read.csv(datafile_name, stringsAsFactors=FALSE)

data_sf <- sf::st_as_sf(data, wkt='the_geom')


plot(data_sf)

ggplot() + 
  geom_polygon(data = urbnmapr::states, mapping = aes(x = long, y = lat, group = group),
               fill = 'grey', color = 'white') +
  geom_sf(data=data_sf) +
  coord_sf(xlim = c(-87.4, -87.9),ylim = c(41.69, 42.07))


