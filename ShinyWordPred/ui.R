library(shiny)
library(shinydashboard)


shinyUI(
  dashboardPage(skin="yellow",
                dashboardHeader(title="NLP - Word Prediction App"),
                sidebar <- dashboardSidebar(
                  sidebarMenu(
                    menuItem("App", tabName = "dashboard", icon = icon("dashboard")),
                    menuItem("Read Me", icon = icon("th"), tabName = "widgets",
                             badgeLabel = "new", badgeColor = "green"),
                    menuItem("GitHub Link", icon = icon("file-code-o"), 
                             href = "https://github.com/zilohub/wordpredictionapp", badgeLabel = "goodies")
              
                  )),
                
                body <- dashboardBody(
                  tabItems(
                    tabItem(tabName = "dashboard",
                  fluidRow(
                    box(
                      strong('Instructions'),
                      tags$ul(
                        tags$li(p("Input any phrase, word, but do not input symbols or numbers only. Prediction function only works with phrases.")),
                        tags$li(p('Adjust number of words to be predicted (1 to 10)')),
                      ),
                      strong('Output'),
                      p('The suggested next words will be shown, the predicted words will be listed with the descending order of frequency'),
                    ),
                    box(
                      title= "Enter text", solidHeader=TRUE, status="primary",background="black",
                      textAreaInput('textin', "Enter text", value =" ",cols=50, rows=3),
                    ),
                    box(
                      title="Number of predictions",solidHeader=TRUE,status="primary",background="black",
                      sliderInput('wordN', '',
                                  min = 1, max =10, value = 5, step = 1),
                    ),
                    box(
                      title="Next Predicted Word", solidHeader = TRUE, status="primary",background="black",
                      verbatimTextOutput('predicted')
                    )
                   
                    
                  )
                  ),
                  tabItem(tabName = "widgets",
                  h2("Information on the App"),     
                  br(),
                  includeMarkdown("include.md")
                  )
                  
                )
                
                
                
  )        


  
  
  )

)





