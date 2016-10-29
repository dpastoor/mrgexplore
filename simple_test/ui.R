
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
                          step <- ifelse(val < 5, 0.25, 1)
                          sliderInput(param, 
                                      param, 
                                      value = val, 
                                      min = val/10+step, #so min value 0
                                      max = val*5, 
                                      step = step)
                        }),
                        br()
               )
             )),
      column(9,
             plotOutput("default_plot"))
    )
  )
))}
