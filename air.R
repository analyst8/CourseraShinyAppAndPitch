# This is a Shiny web application for coursera. 
# The application can be run by clicking the 'Run App' button above.


library(shiny)
data("airquality")

# Daily air quality measurements in New York, May to September 1973.

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Air Quality Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 30,
                        value = 20)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- airquality[, 4]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'blue', border = 'grey', xlab="Temp F", main="Maximum daily temperature at La Guardia Airport")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
