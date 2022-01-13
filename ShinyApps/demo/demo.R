library(shiny)
titlePanel("My first app")

sidebarLayout(
    sidebarPanel("App input control panel",
                 selectInput("x_select", label = h3("Select x-axis"), 
                             choices = list("Sample 1" = "sample1", 
                                            "Sample 2" = "sample2", 
                                            "Sample 3" = "sample3",
                                            "Sample 4" = "sample4",
                                            "Sample 5" = "sample5",
                                            "Sample 6" = "sample6"), 
                             selected = "sample1"),
                 selectInput("y_select", label = h3("Select y-axis"), 
                             choices = list("Sample 1" = "sample1", 
                                            "Sample 2" = "sample2", 
                                            "Sample 3" = "sample3",
                                            "Sample 4" = "sample4",
                                            "Sample 5" = "sample5",
                                            "Sample 6" = "sample6"), 
                             selected = "sample2")
    ),
    mainPanel("App output panel",
              plotOutput("my_plot", width = 600, height = 600)
    )
)
output <- c()
output$my_plot <- renderPlot({
    dat <- read.csv("data-files/r-more-files/shiny_sample_data.csv", row.names = 1)
    x_ax <- dat[,input$x_select]
    y_ax <- dat[,input$y_select]
    
    plot(x = x_ax, y = y_ax, xlab = input$x_select, ylab = input$y_select)
})
