#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggmap)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("How much of my life have I spent here?"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      dateInput("Birthdate", "Birthdate:", value="2016-12-06"),
      textInput("CityVisited", 
                "Location", 
                value="Boston"),
      numericInput("TripLength", 
                "Length of stay in days", 
                value="83")
      
    ),
    
    # Show a map of where you've been, 
    # where cities are weighted by the length of time you've been there
    mainPanel(
      h3(textOutput("instructions")),
      leafletOutput("map"),
      textOutput("caption")
    )
  )
))

