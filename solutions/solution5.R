library(ggplot2)
library(shiny)

#Changed up the input and output IDs so that they don't conflict with the earlier app.  
ui <- fluidPage(
    titlePanel("My slightly more complicated app"),
    
    sidebarLayout(
    sidebarPanel("App input control panel",
                 selectInput("x_select3", label = h3("Select x-axis"), 
                             choices = list("sample1", 
                                            "sample2", 
                                            "sample3",
                                            "sample4",
                                            "sample5",
                                            "sample6"), 
                             selected = "sample1"),
                 selectInput("y_select3", label = h3("Select y-axis"), 
                             choices = list("sample1", 
                                            "sample2", 
                                            "sample3",
                                            "sample4",
                                            "sample5",
                                            "sample6"),
                             selected = "sample2"),
                 sliderInput("n_rows", label = "Select number of rows to show", min = 1, max = 15, value = 1)
    ),
    mainPanel("App output panel",
              plotOutput("plot3", width = 600, height = 600),
              tableOutput("table1")
    )
    )
)

server <- function(input, output) {
output$plot3 <- renderPlot({
    dat <- read.csv("data-files/shiny_sample_data.csv", row.names = 1)
    x_axis <- dat[, input$x_select3]
    y_axis <- dat[, input$y_select3]
    
    plot(x = x_axis, y = y_axis)
})


output$table1 <- renderTable({
    dat <- read.csv("data-files/shiny_sample_data.csv", row.names = 1)
    head(dat[, c(input$x_select3, input$y_select3)], n = input$n_rows)
})
}

shinyApp(ui = ui, server = server)
