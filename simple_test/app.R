source("ui.R") 
source("server.R")
library(shiny)
mod <- mread("one_cmpt_f")
mod <- mod %>% ev(amt=100, ii=6,addl=8)     
    ##' Extract annotations
params <- mrgsolve:::details(mod) %>% 
  filter(block == "PARAM")
mod_params <- as.list(param(mod))
shiny_param_list <- mod_params[which(names(mod_params) %in% params$name)]
names(shiny_param_list)
ui <- make_ui(shiny_param_list)
server <- make_server(mod, shiny_param_list)
shinyApp(ui = ui, server = server)