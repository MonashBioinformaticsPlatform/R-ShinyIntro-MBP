# Uppercase/ Lowercase strings 
library(Biostrings)
library(shiny)
ui <- fluidPage(
    textInput("name", "What's your name?"),
    textOutput("reverse")
)

server <- function(input, output, session) {
    
    output$reverse <- renderText({
        rev <- reverse(input$name)
        paste0("The reverse of your name is: ",rev , "!")
    })
}

shinyApp(ui,server)
