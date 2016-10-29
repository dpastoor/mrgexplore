
library(shiny)

make_ui <- function(param_list) {
  return(fluidPage(
  
  # Application title
  titlePanel("mrgexplore"),
  fluidPage(
    fluidRow(
      column(3,
             tabsetPanel(
               tabPanel("P1",
                        br(),
                        lapply(names(param_list), function(param) {
                          val <- param_list[[param]]
                          sliderInput(param, 
                                      param, 
                                      value = val, 
                                      min = round(val/10+1), #so min value 0
                                      max = val*10, 
                                      step = 1)
                        }),
                        br()
               )
             )),
      column(9,
             plotOutput("default_plot"))
    )
  )
))}
