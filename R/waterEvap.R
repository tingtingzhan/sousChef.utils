

waterEvap <- \(x) UseMethod(generic = 'waterEvap')

#' @export
waterEvap.default <- \(x) 0
