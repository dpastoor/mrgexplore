bin_params <- function (params, nparams = 6) 
{
    if (!is.vector(params)) 
        stop("params must be a vector")
    if (length(params) <= nparams) {
      return(rep(1, length(params)))
    }
    mod <- length(params)%/%nparams
    remainder <- length(params)%%nparams
    bin_number <- c(rep(1:mod, each = nparams), rep(mod + 
        1, times = remainder))
    if (length(bin_number) != length(params)) 
        stop("something went wrong in bin_number calculation")
    return(bin_number)
}