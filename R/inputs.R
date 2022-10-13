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
      `for` = "normal",
      class = sprintf("drac-text drac-text-%s", textColor),
      label
    )
  )
}
