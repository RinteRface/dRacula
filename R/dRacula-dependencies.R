#' dRacula dependencies utils
#'
#' @description This function attaches dRacula dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_dRacula_deps <- function(tag) {
 dRacula_deps <- htmlDependency(
  name = "dRacula",
  version = "0.0.0.9000",
  src = c(file = "dRacula-0.0.0.9000"),
  script = "js/dRacula.js",
  package = "dRacula",
 )
 tagList(tag, dRacula_deps)
}
    
