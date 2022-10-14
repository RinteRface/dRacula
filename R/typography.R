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

#' Generate class for text and p elements
#'
#' @param color Text color.
#' @param align Text alignement.
#' @param weight Text weight.
#' @param size Text size.
#'
#' @return String
#' @keywords internal
dracula_text_cl <- function(color = "white", align = "left",
                            weight = "normal", size = "md") {
  sprintf(
    "drac-text drac-text-%s drac-line-height drac-text-%s
      drac-text-%s drac-text-%s",
    color,
    align,
    weight,
    size
  )
}

#' Dracula paragraph
#'
#' @param ... Text.
#' @param lineHeight Text line height.
#' @inheritParams dracula_text_cl
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
    class = paste(
      dracula_text_cl(
        color,
        align,
        weight,
        size
      ),
      sprintf("drac-line-height-%s", lineHeight)
    ),
    ...
  )
}

#' Dracula text
#'
#' @inheritParams dracula_p
#'
#' @seealso \url{https://ui.draculatheme.com/text}.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_text("The quick vampire", color = "red")
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_text <- function(..., color = "white", align = "left",
                         weight = "normal", size = "md") {
  tags$span(
    ...,
    class = dracula_text_cl(
      color,
      align,
      weight,
      size
    )
  )
}

#' Dracula link
#'
#' @param ... Link text.
#' @param href Link adress.
#' @inheritParams dracula_text
#' @param hoverColor Hover color.
#'
#' @seealso \url{https://ui.draculatheme.com/anchor#}.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_link(
#'     "Dracula UI",
#'     href = "https://ui.draculatheme.com/welcome",
#'     weight = "bold"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_link <- function(..., href, color = "white",
                         weight = "normal", size = "md",
                         hoverColor = "purple") {
  tags$a(
    target = if (href != "#") "_blank",
    href = href,
    class = sprintf(
      "drac-anchor drac-text drac-text-%s drac-text-%s--hover",
      color,
      hoverColor
    ),
    ...
  )
}
