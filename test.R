library(shiny)
ui <- inputPanel(
    selectInput("n_breaks", label = "Number of bins:", choices = c(10, 20, 30, 50), selected = 20)#,
)



# Define server logic ----
server <- function(input, output) {
    renderPlot({
        hist(faithful$eruptions, probability = TRUE, breaks = as.numeric(input$n_breaks),
             xlab = "Duration (minutes)", main = "Geyser eruption duration")
        
    })
    
}

# Run the app ----
shinyApp(ui = ui, server = server)