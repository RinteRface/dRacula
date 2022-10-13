#' Dracula page wrapper
#'
#' Provides necessary dependencies as well
#' as dark theme.
#'
#' @param ... Shiny UI elements.
#'
#' @return An HTML tag
#' @export
dracula_page <- function(...) {
  add_dependencies(
    shiny::fluidPage(
      # dracula white/black colors
      theme = bslib::bs_theme(
        version = 5,
        bg = "#1d1e26",
        fg = "#f8f8f2",
      ),
      ...
    ),
    deps = c("dracula")
  )
}
