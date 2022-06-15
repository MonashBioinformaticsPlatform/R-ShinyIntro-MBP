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
    
    mainPanel(
      textOutput("name") ,
      textOutput("outvar"), 
      textOutput("outrange") 
    )
  )
)

# Server logic ----
server <- function(input, output) {
  
  output$name <- renderText({
    paste0("The dataset selected is ",input$dataset)
  })
  
  output$outvar <- renderText({
   paste0("The variable selected is ", input$var)
  })

  output$outrange <- renderText({
    paste0("The range selected is ", input$range[1], ":", input$range[2]) # or just renderPrint({ input$range })
  })
}
# Run the app ----
shinyApp(ui = ui, server = server)
