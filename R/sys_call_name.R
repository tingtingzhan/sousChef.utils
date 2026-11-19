

#' @title \link[base]{name} Part of \link[base]{sys.call}
#' 
#' @description
#' The \link[base]{name} part of the \link[base]{sys.call}.
#' 
#' @param ... parameters of the function \link[base]{sys.call}
#' 
#' @returns
#' The function [sys_call_name()] returns a \link[base]{name}.
#' 
#' @examples
#' foo = \() {
#'   sys_call_name(which = -1L)
#' }
#' foo()
#' @keywords function-call-stack name
#' @export
sys_call_name <- \(...) {
  
  z <- sys.call(...)[[1L]] # let err!!
  
  if (is.symbol(z)) return(z)
  
  if (as.character(z[[1L]]) %in% c('::', ':::')) {
    return(z[[3L]])
  } 
  
  stop('unsupported ', sQuote(z))
  
}

