# Convert string to uppercase
library(shiny)
ui <- fluidPage(
    textInput("name", "What's your name in lowercase?"),
    textOutput("upper")
)

server <- function(input, output, session) {
    
    output$upper <- renderText({
        upper <- toupper(input$name)
        paste0("Your name in uppercase letters is: ",upper)
    })
}

shinyApp(ui,server)
