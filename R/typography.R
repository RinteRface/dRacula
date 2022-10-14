#' Dracula heading tags
#'
#' @param ... Text.
#' @param tagName Tag function: h1 until h6.
#' @param color Text color.
#' @param size Text size.
#'
#' @seealso \url{https://ui.draculatheme.com/heading}.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_heading("Hello World", "h2"),
#'   dracula_heading(
#'     "Hello World",
#'     "h2",
#'     color = "pink-purple",
#'     size = "2xl"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_heading <- function(..., tagName = "h1", color = "purple",
                            size = "xl") {
  tags[[tagName]](
    class = sprintf(
      "drac-heading drac-heading-%s drac-text-%s",
      size,
      color
    ),
    ...
  )
}
