library(shiny)
    function(input, output, session) {
      library(mrgsolve)
      library(dplyr)
      mod <- mread("one_cmpt_f")
      
      ##' Extract annotations
      params <- mrgsolve:::details(mod) %>% 
        filter(block == "PARAM")
      
      mod_params <- as.list(param(mod))
      shiny_params <- mod_params[which(names(mod_params) %in% params$name)]
      
      
      idata <- shiny_params %>% bind_cols() 
      
      nidata <- reactive({
      idata %>% mutate(CL = as.numeric(input$CL),
                                 V = 50,
                                 KA = 1)
      })
      output$default_plot <- renderPlot({
        mod %>% ev(amt=100, ii=12,addl=3) %>% 
          mrgsim(idata = nidata()) %>% 
          plot
      })
   
    
    }


