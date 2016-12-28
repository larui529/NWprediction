#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage( 
        includeCSS("style.css"),
  
  # Application title
  headerPanel("A Shiny Word Predictor!"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h4("Options"),
        helpText("Number of suggestions"),
      
       selectInput("select", label = h5("Select num results"),
                   choices = word.Pred),
       actionButton("startButton", label = h5("Start Prediction")),
       br()
       
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       textInput("text", label = h4("Text input"),
                 value = "Enter text here...", width = '100%'),
       
       textOutput("wordcount"),
       hr(),
       
       h4("prediction result"),
       tags$style(type="text/css", "#string { height: 100px; width: 
                  100%; text-align:center; font-size: 100px; display: block;}"),
       verbatimTextOutput("p1")
      # actionButton("p2", label = pred[,1][2]),
     #  actionButton("p3", label = pred[,1][3])
    )
  ),
 
        h3("Info"),
        h4("How to use the app"),
        helpText("There are a number of options that the user can 
                tweak depending on what they are looking for."),
        helpText("As a basic this app requires you to input text in the text
                 area. Thenk cliking on \" start prediction \" to show prediction result
                Underneath the text you are promped with a number of next 
                 suggestions. "),
        helpText("Top ranking predictions are ordered from left to right but not
                 necessarily from the top line to the next prediction line down."),
  
        h3("The Options"),
        h4("Number of suggestions"),
        helpText("This option allows the user to pick the number of predictions
                 that should be made in each of the suggestion categories. The
                 app allows up to seven predictions."),
  
        h3("What this app is about"),
        helpText("This app was made as part of the Coursera Data Science
                 Specialisation. The capstone project being a collaboration
                 between John Hopkins University and Swiftkey."),
  
        h3("About the Author"),
        helpText("Date: Dec. 2016"),
        helpText("Me: Rui La")
)
)