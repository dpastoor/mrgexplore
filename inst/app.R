source("ui.R") 
source("server.R")
library(shiny)
library(dplyr)
library(mrgsolve)
mod <- mread("one_cmpt_f")
mod <- mod %>% ev(amt=100, ii=6,addl=8)     
##' Extract annotations

mrgexplore <- function(mod) {
  # only params should be editable in sliders (for now at least)
  shiny_param_list <- as.list(mrgsolve::param(mod))
  ui <- make_ui(shiny_param_list)
  server <- make_server(mod, shiny_param_list)
  shinyApp(ui = ui, server = server)
}

mod %>% mrgexplore
