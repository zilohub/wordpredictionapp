library(shiny)
library(shinydashboard)
library(data.table)

shinyServer(function(input,output){
    # Prediction function
    source("nextWordsApp.R")
    # Prediction table
    nGram <- fread('predictionFreqTable.csv')
    # Predict next word
    observe({ #interactive mode
        textin <- as.character(input$textin)
        n <- input$wordN
        result <- nextWordsApp(textin, n, nGram)
        
        if (textin == '') {
            output$predicted <- renderPrint(cat(''))
        } else {
            output$predicted <- renderPrint(cat(result, sep = '\n'))
        }
        
    })
    
})