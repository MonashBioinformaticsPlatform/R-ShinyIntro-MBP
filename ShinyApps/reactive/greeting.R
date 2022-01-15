ui <- fluidPage(
    textInput("name", "What's your name?"),
    textOutput("greeting"),
    textOutput("reverse")
)

server <- function(input, output, session) {
    output$greeting <- renderText({
        paste0("Hello ", input$name, "!")
    })
    
    output$reverse <- renderText({
        rev <- reverse(input$name)
        paste0("The reverse of your name is: ",rev , "!")
    })
}

shinyApp(ui,server)
