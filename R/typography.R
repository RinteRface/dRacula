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

#' Dracula paragraph
#'
#' @param ... Text.
#' @param color Text color.
#' @param align Text alignement.
#' @param weight Text weight.
#' @param size Text size.
#' @param lineHeight Text line height.
#'
#' @seealso \url{https://ui.draculatheme.com/paragraph}.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_p(
#'     "Dracula is an 1897 Gothic horror novel by Irish author Bram Stoker. It
#'      introduced the character of Count Dracula and established many conventions
#'      of subsequent vampire fantasy. The novel tells the story of Dracula's
#'      attempt to move from Transylvania to England so that he may find new blood
#'      and spread the undead curse, and of the battle between Dracula and Professor
#'      Abraham Van Helsing.",
#'     color = "pink-purple",
#'     align = "center",
#'     weight = "bold",
#'     size = "lg",
#'     lineHeight = "xs"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_p <- function(..., color = "white", align = "left",
                      weight = "normal", size = "md",
                      lineHeight = "md") {
  tags$p(
    class = sprintf(
      "drac-text drac-text-%s drac-line-height drac-text-%s
      drac-text-%s drac-text-%s drac-line-height-%s",
      align,
      color,
      weight,
      size,
      lineHeight
    ),
    ...
  )
}
