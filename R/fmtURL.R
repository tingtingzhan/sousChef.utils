
#' @title [fmtURL()]
#' 
#' @param x \link[base]{character} scalar
#' 
#' @param fmt see the function \link[base]{sprintf}
#' 
#' @param text see the function \link[cli]{style_hyperlink}
#' 
#' @param ... additional parameters, currently of no use
#' 
#' @examples
#' 'da_hsN9Y4V0' |>
#'  fmtURL(fmt = 'https://youtu.be/%s')
#' 
#' @importFrom cli style_hyperlink
#' @export
fmtURL <- \(x, fmt, text = x, ...) {
  x |>    
    sprintf(fmt = fmt) |>
    style_hyperlink(text = text, url = _)
}


