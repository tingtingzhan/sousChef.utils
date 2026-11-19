

#' @title [waterEvap()]
#' 
#' @param x see **Usage**
#' 
#' @export
waterEvap <- \(x) UseMethod(generic = 'waterEvap')

#' @export
waterEvap.default <- \(x) 0
