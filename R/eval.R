
#' @title [eval_()]
#' 
#' @param x \link[base]{character} scalar
#' 
#' @param ... additional parameters of the function \link[base]{eval}
#' 
#' @export
eval_ <- \(x, ...) {
  if (identical(x, make.names(x))) {
    x |>
      call(name = _) |>
      eval(...)
  } else {
    x |>
      str2lang() |>
      eval(...)
  }
}


