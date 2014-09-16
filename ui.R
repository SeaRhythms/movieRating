library(shiny)
library(ggplot2)
# Predicted movie raiting by length in minutes

shinyUI(fluidPage(

    # Application title
    titlePanel("Movie rating prediction"),
        
    sidebarLayout(
        # Get the length of movie     
        sidebarPanel(
            numericInput('mlength', 'Length of movie in minutes',90,min = 60,max = 240),
            br(),
            br(),
            strong("Instructions"),
            p("Enter the length of a movie in minutes directly or use the up and down",
              "arrow keys and see the prediction overlayed on a histogram", 
              " of all the data. The prediction comes from a linear regression of ",
              " all the movie ratings.")
        
        # Show a histogram with the prediction 
        mainPanel(
            plotOutput("displayHist")
        )
    )
))

