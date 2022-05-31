# Activity 2

# Original layout:
ui <- fluidPage( 
    titlePanel("this is a title panel"),
    
    sidebarLayout( 
        sidebarPanel("this is the sidebar panel"),
        mainPanel( 
            tabsetPanel( # this function takes an argument of `position = "left"` (arguments can be "left", "right", "below". default is above)
                # this argument directs where the tabs are positioned
                tabPanel("plot results"),
                tabPanel("table results"),
                tabPanel("fun gifs")
            )
        )
    )
)

server <- function(input, output, session) {
    # back end logic
}

shinyApp(ui, server) # runs the app

# Activity 2: Moving tabset outside sidebarLayout
ui <- fluidPage( 
    titlePanel("this is a title panel"),
    tabsetPanel( # this function takes an argument of `position = "left"` (arguments can be "left", "right", "below". default is above)
        # this argument directs where the tabs are positioned
        tabPanel("plot results"),
        tabPanel("table results"),
        tabPanel("fun gifs")
    ),
    sidebarLayout( 
        sidebarPanel("this is the sidebar panel"),
        mainPanel( 
            
        )
    )
)

server <- function(input, output, session) {
    # back end logic
}

shinyApp(ui, server) # runs the app
