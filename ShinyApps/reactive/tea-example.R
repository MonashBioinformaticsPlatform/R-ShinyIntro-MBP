ui_tea <- fluidPage(
    titlePanel("Ronald's exact test"),
    numericInput("tea", "Tea first", 3),
    numericInput("milk", "Milk first", 3),
    numericInput("tea_correct", "Tea first correctly called", 2),
    numericInput("milk_correct", "Milk first correctly called", 2),
    textOutput("p_text"))

permutations <- function(items)
    do.call(cbind, lapply(seq_along(items),
                          function(i) rbind(items[i], permutations(items[-i]))))

server_tea <- function(input, output, server) {
    output$p_text <- renderText( withProgress(message="Computing p", {
        x <- c(rep(0,input$tea), rep(1,input$milk))
        y <- c(rep(0,input$tea_correct), rep(1,input$tea-input$tea_correct),
               rep(0,input$milk-input$milk_correct), rep(1,input$milk_correct))
        statistic <- sum(x == y)
        x_perms <- permutations(x) # <- this is slow
        distribution <- colSums(x_perms == y)
        p <- mean(distribution >= statistic)
        
        paste0("p-value is ",p)
    }))
}

shinyApp(ui_tea, server_tea)

ui_tea_tabset <- fluidPage(
    titlePanel("Ronald's exact test"),
    tabsetPanel(
        tabPanel("Input",
                 br(),
                 numericInput("tea", "Tea first", 3),
                 numericInput("milk", "Milk first", 3),
                 numericInput("tea_correct", "Tea first correctly called", 2),
                 numericInput("milk_correct", "Milk first correctly called", 2)),
        tabPanel("Result",
                 br(),
                 textOutput("p_text"))))

permutations <- function(items){
    do.call(cbind, lapply(seq_along(items),
                          function(i) {rbind(items[i], permutations(items[-i]))}
                          ))}
shinyApp(ui_tea_tabset, server_tea, options=list(height=500))
