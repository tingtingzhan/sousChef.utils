

#' @title [key()]
#' 
#' @param x see **Usage**
#' 
#' @name key
#' @export
key <- \(x) UseMethod(generic = 'key')

#' @rdname key
#' @export
key.name <- \(x) {
  if (identical(x, quote(`<UNDEFINED>`))) return(character())
  
  z <- x |>
    as.character() |>
    strsplit(split = '_')
  z <- z[[1L]]
  
  z[length(z)]
}




#' @rdname key
#' @export
key.default <- \(x) {
  # \linkS4class{recipe}, \linkS4class{nutrition}
  x@call |>
    key.name()
}








#' @title [waterEvap()]
#' 
#' @param x see **Usage**
#' 
#' @export
waterEvap <- \(x) UseMethod(generic = 'waterEvap')

#' @export
waterEvap.default <- \(x) 0



