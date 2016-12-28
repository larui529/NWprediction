#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        output$wordcount <- renderText({
                paste("Word count: ",
                sum(sapply(strsplit(input$text, " "), length))
                )
        })
        
        output$p1 <- renderText({
                input$startButton
                input$select
                input$text
                
                isolate(as.character(pred.nwd.model(input$text)[,1][1:as.numeric(input$select)]))
        })
       
    
    
  })
  

