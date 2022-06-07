library(readxl)
library(raster)
library(tidyverse)
library(leaflet)
library(shiny)

tag.map.title <- tags$style(HTML(".leaflet-control.map-title { 
  transform: translate(-50%,20%);position: fixed !important;left: 50%;
  text-align: center;padding-left: 10px; padding-right: 10px; 
    background: rgba(255,255,255,0.75);font-weight: bold;font-size: 14px;}
"))

#les données
m_gouv2<- getData(name="GADM",  country="TUN", level=1) 
nada <- read_excel("data_map.xlsx")


maps_format
i=match(m_gouv2@data$HASC_1, maps_format$HASC)
m_gouv2@data$name=maps_format$Gouvernorat[i]
m_gouv2@data$pourc=maps_format$Pourcentage[i]

#les pop ups
my_popup <- paste0("<strong>",m_gouv2@data$name,"</strong>"," Nombre de décès:",m_gouv2@data$pourc," %")
#les maps
pal1 <- colorNumeric(palette = rev(heat.colors(10)),domain = m_gouv2@data$pourc)
h=leaflet(data = m_gouv2) %>% addTiles() %>% addProviderTiles(providers$CartoDB.Positron)%>%
  addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.5,
              color = ~pal1(m_gouv2@data$pourc),popup = my_popup) %>%
  addLegend("bottomright", pal = pal1, values = ~m_gouv2@data$pourc,
            title = "Pourcentage",labFormat = labelFormat(),opacity = 0.5) 


