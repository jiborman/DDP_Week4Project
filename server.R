#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggmap)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  require(ggmap)
  require(leaflet)
  
  output$instructions<-renderText("Put in your birthdate, a location you've visited and how many days you spent there. 
The map will update and tell you the percentage of your lifetime that you've spent in that location. 
                                  Click on the map icon to find out!")
  output$caption<-renderText("Location determined using the ggmap package, which searches google maps for the latitude and longitude of your location.")
  
  output$map <- renderLeaflet({

    leaflet() %>%
      addTiles() %>%
      addCircleMarkers(lat=geocode(input$CityVisited)$lat, 
                       lng=geocode(input$CityVisited)$lon,
                       radius=10, 
                       weight = 25*(input$TripLength/(as.numeric(Sys.Date()-input$Birthdate))),
                       popup = paste0("You have spent ",
                                      round(100*input$TripLength/(as.numeric(Sys.Date()-input$Birthdate)), 2) ,
                                      "% of your lifetime in ",
                                      input$CityVisited))
  })
  
})
