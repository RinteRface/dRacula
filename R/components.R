#' Dracula card container
#'
#' @param ... Card content.
#' @param color Background color.
#' @param glowColor Glow color.
#' @param borderColor Border color. Only if
#' outline is TRUE.
#' @param size Padding and margin.
#' @param rounded Rounded corners.
#' @param outline Alternate appearance.
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
#'     outline = TRUE
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
    outline = FALSE,
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

  if (outline) {
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

#' Dracula badge
#'
#' @inheritParams dracula_card
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_badge("Hello World", color = "animated"),
#'   dracula_badge(
#'     "1",
#'     color = "red",
#'     outline = TRUE
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_badge <- function(..., color, outline = FALSE, size = "md") {
  badge_tag <- tags$span(
    class = sprintf(
      "drac-badge drac-text-%s drac-m-%s",
      color,
      size
    ),
    ...
  )

  if (outline) {
    tagQuery(badge_tag)$
      addClass(
        sprintf(
          "drac-badge-subtle drac-bg-%s-transparent",
          color
        )
      )$
      allTags()
  } else {
    tagQuery(badge_tag)$
      addClass(sprintf("drac-bg-%s", color))$
      allTags()
  }
}
