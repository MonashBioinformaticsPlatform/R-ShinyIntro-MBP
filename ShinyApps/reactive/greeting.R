ui <- fluidPage(
    textInput("name", "What's your name?"),
    textOutput("greeting")
)

server <- function(input, output, session) {
    output$greeting <- renderText({
        paste0("Hello ", input$name, "!", "\n", "Have a nice day!")
    })
}

shinyApp(ui,server)
