library(mrgsolve)
library(dplyr)
mod <- mread("one_cmpt_f")

mod %>% ev(amt=100, 
            ii=12, 
            addl=3) %>% mrgsim %>% plot
mod %>% ev(amt=100, ii=12,addl=3) %>% mrgsim(nid=10) %>% plot

##' Extract annotations
params <- mrgsolve:::details(mod) %>% 
  filter(block == "PARAM")

mod_params <- as.list(param(mod))
shiny_params <- mod_params[which(names(mod_params) %in% params$name)]


idata <- shiny_params %>% bind_cols() 

mod %>% ev(amt=100, ii=12,addl=3) %>% mrgsim() %>% plot

nidata <- idata %>% mutate(CL = 10,
                           V = 50,
                           KA = 1)
mod %>% ev(amt=100, ii=12,addl=3) %>% 
  mrgsim(idata = nidata) %>% 
  plot