# Slider
ui <- fluidPage(
    titlePanel("Example slider"),
    sliderInput("slider1", "Decimal",
            min = -1, max = 1,
            value = 0.8, step = 0.2),
    
    fluidRow(
        column(4, verbatimTextOutput("value"))
    )
)

# Define server logic ----
server <- function(input, output) {
    output$value <- renderPrint({paste("The number selected by the slider is:", input$slider1)})
}

# Run the app ----
shinyApp(ui = ui, server = server)

