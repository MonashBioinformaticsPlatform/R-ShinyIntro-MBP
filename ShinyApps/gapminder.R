library(tidyverse)
library(shiny)

gap <- read_csv("data-files/gap-minder.csv")
geo <- read_csv("data-files/geo.csv")
head(gap)
head(geo)
gap_geo <- gap %>% left_join(geo, by = "name")
head(gap_geo)

ui <- fluidPage(
    titlePanel("Gapminder Data"),
    sidebarLayout(
        sidebarPanel(
            helpText("Data trends over time")
            
            selectInput("dataset", label = "Dataset", choices = gap_geo)),
            
            helpText("List of variables to choose from"),
            
            selectInput("var", 
                        label = "Choose a variable to display",
                        choices = colnames(gap_geo),
                        selected = "life_exp")
        ),
        
        mainPanel()
    )
)

# Server logic ----
server <- function(input, output) {
    
}

# Run the app ----
shinyApp(ui = ui, server = server)