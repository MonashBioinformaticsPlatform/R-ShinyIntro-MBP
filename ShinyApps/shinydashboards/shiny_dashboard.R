library(shiny)
library(shinydashboard)
library(Biostrings)

ui <- dashboardPage(
    dashboardHeader(title = "My first dashboard"),
    
    dashboardSidebar(sidebarMenu(
        menuItem("Hello", tabName = "hello"),
        menuItem("Widgets", tabName = "widgets"),
        menuItem("Example", tabName = "example")
    )),
    
    dashboardBody(tabItems(
        # First tab content
        tabItem(tabName = "hello",
                fluidRow(
                    h2("Hello, Shiny!"),
                    h3("This is an example of Shiny dashboard.")
                    
                    
                )
        ),
        
        # Second tab content
        tabItem(tabName = "widgets",
                fluidRow(
                h2("Widgets"),
                column(2,
                       h3("Buttons"),
                       actionButton("action", "Action"),
                       br(),
                       br(), 
                       submitButton("Submit")),
                
                column(2,
                       h3("Single checkbox"),
                       checkboxInput("checkbox", "Choice A", value = TRUE))
                ),
                
                fluidRow(
                column(2, 
                       checkboxGroupInput("checkGroup", 
                                          h3("Checkbox group"), 
                                          choices = list("Choice 1" = 1, 
                                                         "Choice 2" = 2, 
                                                         "Choice 3" = 3,
                                                         "Choice 4" = 4),
                                          selected = 1)),
                
                column(2, 
                       dateInput("date", 
                                 h3("Date input"), 
                                 value = "2014-01-01"))   
        )
        ),
        
        #third tab
        tabItem(tabName = "example",
                fluidRow(
                    box(plotOutput("plot1", height = 500)),
                    
                    box(
                        title = "Controls",
                        sliderInput("slider", "Number of observations:", 1, 100, 50)
                    )
                )
        )
                
    )
    )
)

        
        

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)



