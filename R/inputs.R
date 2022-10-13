#' Dracula checkbox
#'
#' @inheritParams shiny::checkboxInput
#' @param color Input color.
#' @param textColor Text color.
#' @param disabled Whether to disable the checkbox.
#' Default to FALSE.
#'
#' @export
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)

#'  ui <- dracula_page(
#'    dracula_checkbox("checkbox", "My checkbox", color = "pink")
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$checkbox)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_checkbox <- function(inputId, label, value = FALSE, width = NULL,
                             color = "purple", textColor = "white",
                             disabled = FALSE) {

  validate_dracula_color(color)

  tags$div(
    class = "drac-box",
    tags$input(
      type = "checkbox",
      #name = "normal",
      disabled = if (disabled) "" else NULL,
      id = inputId,
      class = sprintf("drac-checkbox drac-checkbox-%s", color),
      checked = if (value) NA else NULL
    ),
    tags$label(
      `for` = inputId,
      class = sprintf("drac-text drac-text-%s", textColor),
      label
    )
  )
}


#' Dracula switch
#'
#' Similar to checkbox but with
#' a toggle widget.
#'
#' @inheritParams dracula_checkbox
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)

#'  ui <- dracula_page(
#'    dracula_switch("switch", "My switch input", color = "pink")
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$switch)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_switch <- function(inputId, label, value = FALSE,
                           color = "purple", textColor = "white",
                           disabled = FALSE) {
  tag <- dracula_checkbox(
    inputId,
    label,
    value,
    color = color,
    textColor = textColor,
    disabled = disabled
  )

  tagQuery(tag)$
    find("input")$
    addClass("drac-switch")$
    allTags()
}
