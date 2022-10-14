#' Dracula input builder
#'
#' Internal builder for dracula inputs
#'
#' @inheritParams shiny::textInput
#' @param type Input type.
#' @param color Input color.
#' @param textColor Text color.
#' @param size Input size.
#' @param outline Outline variant.
#' @param borderSize Border size.
#'
#' @keywords internal
dracula_input <- function(
    inputId,
    label,
    value = NULL,
    placeholder = NULL,
    type = c(
      "checkbox",
      "number",
      "text",
      "date",
      "range",
      "radio"
    ),
    color = dracula_colors,
    textColor = dracula_colors,
    size = c("sm", "md", "lg"),
    outline = FALSE,
    borderSize = c("sm", "md", "lg")) {

  valid_color_func <- if (!(type %in% c("checkbox", "radio"))) {
    validate_dracula_color
  } else {
    validate_dracula_extended_color
  }

  valid_color_func(color)
  valid_color_func(textColor)


  if (type %in% c("checkbox", "radio")) {
    input_cl <- sprintf("drac-%s drac-%s-%s", type, type, color)
  } else {
    input_cl <- sprintf("drac-input drac-input-%s drac-text-%s drac-input-%s", color, color, size)
    if (outline) {
      input_cl <- sprintf("%s drac-input-outline", input_cl)
    }
    if (!is.null(borderSize)) {
      input_cl <- sprintf("%s drac-input-border-%s", input_cl, borderSize)
    }
  }

  input_tag <- tags$input(
    type = type,
    name = inputId,
    placeholder = placeholder,
    value = value,
    id = inputId,
    class = input_cl,
  )

  label_tag <- tags$label(
    `for` = inputId,
    class = sprintf("drac-text drac-text-%s", textColor),
    label
  )


  tag_list <- if (type %in% c("checkbox", "radio")) {
    list(input_tag, label_tag)
  } else {
    list(label_tag, input_tag)
  }

  do.call(tags$div, c(list(class = "drac-box"), tag_list))
}

#' Dracula checkbox
#'
#' @inheritParams shiny::checkboxInput
#' @inheritParams dracula_input
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

  tag <- dracula_input(
    inputId,
    label,
    type = "checkbox",
    color = color,
    textColor = textColor
  )

  tagQuery(tag)$
    find("input")$
    addAttrs(
      checked = if (value) NA,
      disabled = if (disabled) ""
    )$
    allTags()
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

#' Dracula text input
#'
#' @inheritParams dracula_input
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)

#'  ui <- dracula_page(
#'    dracula_text_input(
#'     "text",
#'     "My text input",
#'     "Hello World",
#'     color = "orange"
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$text)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_text_input <- function(inputId, label, value = "",
                         width = NULL, placeholder = NULL,
                         color = "white", textColor = "white",
                         size = "md", outline = FALSE,
                         borderSize = "lg") {
  dracula_input(
    inputId,
    label,
    value,
    placeholder,
    type = "text",
    color,
    textColor,
    size,
    outline,
    borderSize
  )
}

#' Dracula action button
#'
#' @inheritParams shiny::actionButton
#' @inheritParams dracula_checkbox
#' @param ghost Ghost style.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)

#'  ui <- dracula_page(
#'    dracula_button(
#'     "btn",
#'     "My action button",
#'     color = "animated"
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$btn)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_button <- function(inputId, label, icon = NULL,
                           width = NULL, ..., color = "purple",
                           textColor = "black",
                           disabled = FALSE, outline = FALSE,
                           ghost = FALSE, size = "md") {

  if (outline && ghost) {
    stop("Chose either outlined or ghost")
  }

  color_cl <- if (!ghost) {
    sprintf("drac-bg-%s", color)
  } else {
    sprintf("drac-bg-%s-transparent", color)
  }

  btn_cl <- sprintf(
    "action-button drac-btn %s drac-m-%s drac-text-%s",
    color_cl,
    size,
    textColor
  )

  if (outline) {
    btn_cl <- sprintf(
      "%s drac-btn-outline",
      btn_cl
    )
  }
  if (ghost) {
    btn_cl <- sprintf(
      "%s drac-btn-ghost",
      btn_cl
    )
  }

  tags$button(
    id = inputId,
    icon = icon,
    class = btn_cl,
    label,
    disabled = if (disabled) ""
  )
}

#' Dracula numeric input
#'
#' @inheritParams shiny::numericInput
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_numeric(
#'     "numeric",
#'     "My numeric input",
#'     200,
#'     min = 10,
#'     max = 1000,
#'     step = 1,
#'     color = "orange"
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$numeric)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_numeric <- function(
    inputId,
    label,
    value,
    min = NA,
    max = NA,
    step = NA,
    width = NULL,
    color = "white",
    textColor = "white",
    size = "md",
    outline = FALSE,
    borderSize = "lg"
) {
  tag <- dracula_input(
    inputId,
    label,
    value,
    placeholder = NULL,
    type = "number",
    color,
    textColor,
    size,
    outline,
    borderSize
  )

  tagQuery(tag)$
    find("input")$
    addAttrs(
      min = if (!is.na(min)) min,
      max = if (!is.na(max)) max,
      step = if (!is.na(step)) step
    )$
    allTags()
}

