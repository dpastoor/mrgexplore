#' ui factory function
#' @param param_list list of params to turn into sliders
#' @param params_per_tab number of parameters per tab
#' @import shiny
#' @export
make_ui <- function(param_list, params_per_tab = 5) {
  # this is a bit hacky, but an easy way to split then separate
  # params into separate list elements
  param_list_split <- data.frame(
    param_names = names(param_list),
    tab_num = bin_params(names(param_list), params_per_tab)
    ) %>% split(.$tab_num) %>% 
    lapply(function(param_index) {
      return(as.character(param_index$param_names))
    })
  tab_params <- lapply(seq_along(param_list_split), function(i) {
                tabPanel(paste0("P", i),
                         br(),
                         lapply(param_list_split[[i]], function(param) {
                           val <- param_list[[param]]
                           step <- ifelse(val < 5, 
                                          ifelse(val < 1, 0.1, 0.25), 
                                          1)
                           sliderInput(param,
                                       param,
                                       value = val,
                                       min = val/10+step, 
                                       max = val*5,
                                       step = step)
                         }),
                         br()
                )
              })
  return(
    fluidPage(
      titlePanel("mrgexplore"),
      fluidPage(
        fluidRow(
          column(3,
                 do.call(tabsetPanel, tab_params)),
          column(9,
                 plotOutput("default_plot")
                 )
        )
      )
    )
  )
}
