# pythagoras example
ui_pythagorus <- fluidPage(
    titlePanel("Hypotenuse app"),
    sliderInput("a", "Length a", 0, 10, 5),
    sliderInput("b", "Length b", 0, 10, 5),
    textOutput("result"))

server_pythagorus <- function(input, output, server) {
    a2 <- reactive({
        cat("Compute a squared.\n")
        
        input$a ** 2
    })
    
    
    b2 <- reactive({
        cat("Compute b squared.\n")
        
        input$b ** 2
    })
    
    
    output$result <- renderText({
        cat("Compute hypotenuse.\n")
        h <- sqrt(a2() + b2())
        cat("Done computing hypotenuse.\n")
        
        paste0("The hypotenuse is ", h)
    })
    
}

shinyApp(ui = ui_pythagorus, server = server_pythagorus)