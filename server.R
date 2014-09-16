library(shiny)
library(ggplot2)
# Predicted movie raiting by length in minutes
# Plot the prediction on a histrogram of all movie ratings 

shinyServer(function(input, output) {
    
    # Generate a histogram wil a line for the prediction 
    output$displayHist <- renderPlot({
        # Only movies between 1 and 4 hours 
        stdmovies <- movies[movies$length>59 & movies$length<241,]
        
        # histogram
        hist(stdmovies$rating, xlab='', col='lightblue', main='Movie ratings')
        
        # prediction 
        movielm <- lm(rating ~ length, data=stdmovies)
        predicted  <- movielm$coefficients["(Intercept)"] + movielm$coefficients["length"] * input$mlength
        lines(c(predicted, predicted),c(0,8000),col="red", lwd=5)
        
        #text(2, 6000, "Predicted rating = ")    
        text(2, 6000, paste("Predicted rating = ", round(predicted,1)) )        
    })
})
