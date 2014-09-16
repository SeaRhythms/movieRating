library(shiny)
library(ggplot2)
# Predicted movie raiting by length in minutes

shinyUI(fluidPage(

    # Application title
    titlePanel("Movie rating prediction"),
        
    sidebarLayout(
        # Get the length of movie     
        sidebarPanel(
            numericInput('mlength', 'Length of movie in minutes',90,min = 1,max = 5300)                                    
        ),
        
        # Show a histogram with the prediction 
        mainPanel(
            plotOutput("displayHist")
        )
    )
))

