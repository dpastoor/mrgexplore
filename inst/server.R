    
make_server <- function(mod, shiny_param_list) {
  return(function(input, output, session) {
    library(mrgsolve)
    library(dplyr)
    idata <- shiny_param_list %>% bind_cols() 
    param_names <- names(shiny_param_list)
    nidata <- reactive({
      dots <- lapply(param_names, function(param) {
        as.numeric(input[[param]])
      })
      idata %>% mutate_(.dots = setNames(dots, param_names))
    })
    output$default_plot <- renderPlot({
      print(nidata())
      mod %>% 
        mrgsim(idata = nidata()) %>% 
        plot
    })
    
    
  })
}    


