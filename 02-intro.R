## ----install_shiny, eval=T, echo = T----------------------------------------------------
# install.packages("shiny")  ## if shiny has not been installed in your R instance, uncomment this and run this
library(shiny)


## ---- eval = F, echo = T----------------------------------------------------------------
## library(shiny) #1. calls the library `shiny`
## ui <- fluidPage( #2. defines user interface, an HTML webpage
##   "Hello, world!" # prints Hello, world! on webpage
## )
## server <- function(input, output, session) { #3. specifies app behavior
## }
## app_hello <- shinyApp(ui, server) # 4. starts Shiny application


## ---- eval = F--------------------------------------------------------------------------
## runApp(app_hello)
## runGadget(app_hello)
## runGadget(app_hello, viewer=dialogViewer("App 1"))
## print(app_hello)
## app_hello

