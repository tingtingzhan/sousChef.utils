

#' @title [zero.omit()]
#' 
#' @param x \link[base]{numeric} \link[base]{vector}
#' 
#' @note
#' Nomenclature \link[stats]{na.omit}
#' 
#' @export
zero.omit <- \(x) {
  if (anyNA(x)) stop('input cannot contain missingness')
  x[abs(x) > .Machine$double.eps] # len0 compatible
}

