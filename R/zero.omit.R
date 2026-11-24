

#' @title Omit Near-Zero Elements 
#' 
#' @description
#' To omit the near-zero elements.
#' 
#' @param x \link[base]{numeric} \link[base]{vector}
#' 
#' @param tol \link[base]{numeric} scalar, default value is `.Machine$double.eps`
#' 
#' @param ... additional parameters, currently not in use
#' 
#' @note
#' The function [zero.omit()] is named after the function \link[stats]{na.omit}.
#' 
#' @export
zero.omit <- \(x, tol = .Machine$double.eps, ...) {
  if (anyNA(x)) stop('input cannot contain missingness')
  x[abs(x) > tol] # len0 compatible
}

