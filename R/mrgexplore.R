#' @importFrom magrittr "%>%"
NULL

#' launch shiny app to explore influence of parameter values
#' @param .model mrgsolve model
#' @importFrom mrgsolve param
#' @export
mrgexplore <- function(.model) {
  # only params should be editable in sliders (for now at least)
  shiny_param_list <- as.numeric(param(.model))
  ui <- make_ui(shiny_param_list)
  server <- make_server(.model, shiny_param_list)
  shinyApp(ui = ui, server = server)
}

