
library(shiny)

fluidPage(
  
  # Application title
  titlePanel("mrgexplore"),
  fluidPage(
    fluidRow(
      column(3,
             tabsetPanel(
               tabPanel("P1",
                        br(),
                        sliderInput("CL", "CL", value =  5, min = 1, max = 10, step = 1),
                        br()
               )
             )),
      column(9,
             plotOutput("default_plot"))
    )
  )
)
