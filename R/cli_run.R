

#' @title Create `.run` \link[cli]{cli_text}
#' 
#' @param text \link[base]{character} scalar
#' 
#' @param pkg \link[base]{character} scalar
#' 
#' @param fun \link[base]{character} scalar
#' 
#' @param ... additional parameters, currently of no use
#' 
#' @references
#' \url{https://cli.r-lib.org/reference/links.html?q=.run#click-to-run-code}
#' 
#' \url{https://cli.r-lib.org/reference/links.html?q=.run#security-considerations}
#' 
#' @examples
#' foo = \() print('hello world')
#' .cli_run(text = 'foo', fun = 'foo') |> cat()
#' 
#' .cli_run(text = 'Current Time', fun = 'Sys.time') |> cat() # "Security considerations"
#' 
#' # https://cli.r-lib.org/reference/links.html?q=.run#click-to-run-code
#' .cli_run(text = 'Snapshot', pkg = 'testthat', fun = 'snapshot_review') |> cat()
#'   
#' @importFrom cli format_inline   
#' @export
.cli_run <- \(text, pkg = 'base', fun, ...) {
  
  ns <- pkg |>
    asNamespace()
  
  is_exported <- fun %in% getNamespaceExports(ns)
  is_unexported <- !is_exported && exists(fun, where = ns, inherits = FALSE)
  in_GlobalEnv <- !is_exported && !is_unexported && identical(environment(get(fun)), .GlobalEnv)
  
  if (in_GlobalEnv) {
    z <- sprintf(
      fmt = '{.run [%s](%s())}', text, fun
    ) |>
      format_inline()
    # does not work.. as.Date('2026-11-05')
    return(z)
  }
  
  if (is_exported) {
    fmt <- '{.run [%s](%s::%s())}'
  } else if (is_unexported) {
    fmt <- '{.run [%s](%s:::%s())}'
    # does not work.. as.Date('2026-11-05')
  } else stop('shouldnt come here')

  sprintf(fmt = fmt, text, pkg, fun) |>
    format_inline() # must!
  
}

