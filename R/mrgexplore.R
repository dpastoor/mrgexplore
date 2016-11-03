#' @importFrom magrittr "%>%"
NULL

#' launch shiny app to explore influence of parameter values
#' @param mod mrgsolve model
#' @export
mrgexplore <- function(mod) {
  # only params should be editable in sliders (for now at least)
  shiny_param_list <- as.list(mrgsolve::param(mod))
  ui <- make_ui(shiny_param_list)
  server <- make_server(mod, shiny_param_list)
  shinyApp(ui = ui, server = server)
}

