#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' Show the platform from sessionInfo
#' @get /platform
function() {
    return(sessionInfo()$platform)
}

#' Plot random random data
#' @get /plot
#' @png
function(spec){
  plot(randu)
}