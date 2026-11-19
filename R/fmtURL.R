
#' @title fmtURL
#' 
#' @param x \link[base]{character} scalar
#' 
#' @param fmt see the function \link[base]{sprintf}
#' 
#' @param text see the function \link[cli]{style_hyperlink}
#' 
#' @param ... additional parameters, currently of no use
#' 
#' @importFrom cli style_hyperlink
#' @export
fmtURL <- \(x, fmt, text, ...) {
  x |>    
    sprintf(fmt = fmt) |>
    style_hyperlink(text = text, url = _)
}





add_tool_url <- \(x, name, brand, ...) {
  v <- x[[name]]
  if (!length(v)) return(x)
  x$name <- v |>
    fmtURL(text = paste(brand, x[['name']]), ...)
  x[[name]] <- NULL
  return(x)
}
