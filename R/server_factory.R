#' create a shiny server to be wired up to sliders 
#' @param mod model parameter
#' @param shiny_param_list list of param and initial values
#' @details 
#' shiny_param_list comes from as.list(param(mod)) and any
#' prior filtering. Any passed in will expect to be modifying
#' the values from the slider inputs
#' @export
make_server <- function(.model, shiny_param_list) {
  return(function(input, output, session) {
    idata <- as.numeric(param(.model)) %>% 
      as.list %>% dplyr::bind_cols() %>% mutate(ID = 1)
    param_names <- names(shiny_param_list)
    nidata <- reactive({
      dots <- lapply(param_names, function(param) {
        as.numeric(input[[param]])
      })
      dplyr::bind_rows(
      idata,
      idata %>% mutate_(.dots = setNames(dots, param_names)) %>%
        mutate(ID = 2)
      )
    })
    output$default_plot <- renderPlot({
      print(nidata())
      .model %>% 
        mrgsolve::zero_re() %>%
        mrgsolve::mrgsim(idata = nidata()) %>% 
        plot
    })
  })
}    


