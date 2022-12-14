#' dracula-ui dependencies utils
#'
#' @description This function attaches dracula-ui. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @export
add_dracula_ui_deps <- function(tag) {
 dracula_ui_deps <- htmlDependency(
  name = "dracula-ui",
  version = "1.0.1",
  src = c(file = "dracula-ui-1.0.1"),
  script = "js/dracula-ui.cjs.production.min.js",
  stylesheet = c(
    "css/dracula-ui.min.css"#,
    #"css/dracula-dashboard.min.css"
  ),
  package = "dRacula",
 )
 tagList(tag, dracula_ui_deps)
}

