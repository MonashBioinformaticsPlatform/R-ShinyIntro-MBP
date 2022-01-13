
library(shiny)
library(utils)


ui <- fluidPage(
    titlePanel("My first app"),
    
    sidebarLayout(
        sidebarPanel("This is a sidebar panel",
                     selectInput(inputId = "x_select", label = "Select x-axis", 
                                 choices = list("sample1", 
                                                "sample2", 
                                                "sample3",
                                                "sample4",
                                                "sample5",
                                                "sample6"), 
                                 selected = "sample1"),
                     selectInput(inputId = "y_select", label = "Select y-axis", 
                                 choices = list("Sample 1" = "sample1", 
                                                "Sample 2" = "sample2", 
                                                "Sample 3" = "sample3",
                                                "Sample 4" = "sample4",
                                                "Sample 5" = "sample5",
                                                "Sample 6" = "sample6"),  
                                 selected = "sample2")
        ),
        mainPanel("And this is the main panel",
                  textOutput(outputId = "check_x_select"),
                  textOutput(outputId = "check_y_select"),
                  plotOutput(outputId = "my_plot", width = 600, height = 600)
        )
    )
)

server <- function(input, output) {
    output$check_x_select <- renderText({
        print(input$x_select)
    })
    
    output$check_y_select <- renderText({
        print(input$y_select)
    })
    
    output$my_plot <- renderPlot({
        
        #Read in the sample csv
        dat <- read.csv("data-files/shiny_sample_data.csv", row.names = 1)
        
        #Pull out the first and second columns in dat
        x_axis <- dat[, "sample1"] # change this value to make it interactive
        y_axis <- dat[, "sample2"] # change this value to make it interactive
        
        #Create a basic dot plot
        plot(x = x_axis, y_axis)
    })
}

shinyApp(ui = ui, server = server)
