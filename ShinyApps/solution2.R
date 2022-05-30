library(shiny)
ui <- fluidPage(
    titlePanel("Challenge 2"),
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", label = "Dataset", choices = ls("package:datasets"), selected = "airquality"),
            
            helpText("List of variables to choose from"),
            
            selectInput("var", 
                        label = "Choose a region to display",
                        choices = list("Ozone", 
                                       "Solar.R",
                                       "Wind", 
                                       "Temp",
                                       "Month",
                                       "Day"),
                        selected = "Wind"),
            
            sliderInput("range", 
                        label = "Range of wind speed:",
                        min = 0, max = 30, value = c(5, 21))
        ),
        
        mainPanel()
    )
)

# Server logic ----
server <- function(input, output) {
    
}

# Run the app ----
shinyApp(ui = ui, server = server)