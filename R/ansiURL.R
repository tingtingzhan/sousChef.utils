

#' @title [ansiURL()]
#' 
#' @param x ..
#' 
#' @examples
#' ansiURL('https://www.google.com')
#' 
#' @importFrom cli ansi_has_any
#' @export
ansiURL <- \(x) {
  if (length(x) != 1L) stop()
  if (ansi_has_any(x, link = TRUE)) return(x)
  x |>
    gsub('^https://|^http://', replacement = '', x = _) |> 
    style_hyperlink(url = x, text = _)
}
