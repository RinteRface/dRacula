#' Dracula card container
#'
#' @param ... Card content.
#' @param color Background color.
#' @param glowColor Glow color.
#' @param borderColor Border color. Only if
#' variant is TRUE.
#' @param size Padding and margin.
#' @param rounded Rounded corners.
#' @param variant Alternate appearance.
#' @param height Card height.
#' @param width Card width.
#' @param scrollbar Scrollbar color.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_card(
#'     "My first card"
#'    ),
#'   dracula_card(
#'     "My second card",
#'     color = "pink",
#'     borderColor = "pink",
#'     variant = TRUE
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_card <- function(
    ...,
    color = "purple",
    glowColor = NULL,
    borderColor = "purple",
    size = "md",
    rounded = "full",
    variant = FALSE,
    height = "auto",
    width = "auto",
    scrollbar = "purple"
) {

  card_cl <- sprintf(
    "drac-box drac-card drac-bg-%s drac-p-%s drac-m-%s
    drac-rounded-%s drac-h-%s drac-w-%s drac-scrollbar-%s",
    color,
    size,
    size,
    rounded,
    height,
    width,
    scrollbar
  )

  if (!is.null(glowColor)) {
    card_cl <- sprintf(
      "%s drac-glow-%s",
      card_cl,
      glowColor
    )
  }

  card_tag <- tags$div(
    class = card_cl,
    ...
  )

  if (variant) {
    card_tag <- tagQuery(card_tag)$
      addAttrs(variant = "subtle")$
      addClass(
        sprintf(
          "drac-card-subtle drac-text-%s drac-border-%s",
          color,
          borderColor
        )
      )$
      allTags()
    tags$div(card_tag)
  } else {
    card_tag
  }
}
