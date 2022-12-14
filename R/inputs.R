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
    color = dracula_basic_colors,
    textColor = dracula_basic_colors,
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

  do.call(tags$div, c(list(class = "drac-box drac-m-sm"), tag_list))
}

#' Dracula checkbox
#'
#' @inheritParams shiny::checkboxInput
#' @inheritParams dracula_input
#' @param disabled Whether to disable the checkbox.
#' Default to FALSE.
#'
#' @seealso \url{https://ui.draculatheme.com/input} for all
#' available options.
#'
#' @export
#' @rdname checkbox-input
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
#'
#'  # Update checkbox #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update checkbox"),
#'   dracula_checkbox("checkbox", "My checkbox", color = "pink")
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_checkbox(
#'        "checkbox",
#'        label = "Plop",
#'        value = "New value"
#'      )
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

#' Update dracula checkbox input
#'
#' @inheritParams shiny::updateCheckboxInput
#'
#' @return Send message to JavaScript
#' @note label does not work yet.
#' @export
#' @rdname checkbox-input
update_dracula_checkbox <- function(
    inputId,
    label = NULL,
    value = NULL,
    session = getDefaultReactiveDomain())
{
  shiny::updateCheckboxInput(
    session = session,
    inputId = inputId,
    label = label,
    value = value
  )
}

#' Dracula switch
#'
#' Similar to checkbox but with
#' a toggle widget.
#'
#' @inheritParams dracula_checkbox
#' @export
#' @rdname switch-input
#' @seealso \url{https://ui.draculatheme.com/input} for all
#' available options.
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
#'
#'  # Update switch #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update switch"),
#'   dracula_switch("checkbox", "My checkbox", color = "pink")
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_switch(
#'        "checkbox",
#'        label = "Plop",
#'        value = "New value"
#'      )
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

#' Update dracula switch input
#'
#' @inheritParams shiny::updateCheckboxInput
#'
#' @return Send message to JavaScript
#' @note label does not work yet.
#' @export
#' @rdname switch-input
update_dracula_switch <- function(
    inputId,
    label = NULL,
    value = NULL,
    placeholder = NULL,
    session = getDefaultReactiveDomain())
{
  update_dracula_checkbox(inputId, label, value, session)
}

#' Dracula text input
#'
#' @inheritParams dracula_input
#' @rdname text-input
#'
#' @export
#' @seealso \url{https://ui.draculatheme.com/input} for all
#' available options.
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
#'
#'  # Update input #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update text"),
#'   dracula_text_input(
#'     "text",
#'     "My text input",
#'     "Hello World"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_text_input(
#'        "text",
#'        label = "Plop",
#'        value = "New value",
#'        placeholder = "New placeholder"
#'      )
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

#' Update dracula text input
#'
#' @inheritParams shiny::updateTextInput
#'
#' @return Send message to JavaScript
#' @export
#' @rdname text-input
update_dracula_text_input <- function(
    inputId,
    label = NULL,
    value = NULL,
    placeholder = NULL,
    session = getDefaultReactiveDomain())
{
  shiny::updateTextInput(
    session = session,
    inputId = inputId,
    label = label,
    value = value,
    placeholder = placeholder
  )
}

#' Dracula action button
#'
#' @inheritParams shiny::actionButton
#' @inheritParams dracula_checkbox
#' @param ghost Ghost style.
#'
#' @export
#' @rdname action-button
#' @seealso \url{https://ui.draculatheme.com/button} for all
#' available options.
#' @note icon does not work yet.
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
#'
#'  # Update button #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update button"),
#'   dracula_button("button", "My button", color = "animated")
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_button(
#'        "button",
#'        label = "New label",
#'        icon = icon("folder")
#'      )
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
    icon,
    class = btn_cl,
    label,
    disabled = if (disabled) ""
  )
}

#' Update dracula action button
#'
#' @inheritParams shiny::updateActionButton
#'
#' @return Send message to JavaScript
#' @export
#' @rdname action-button
update_dracula_button <- function(
    inputId,
    label = NULL,
    icon = NULL,
    session = getDefaultReactiveDomain()
) {
  shiny::updateActionButton(
    session = session,
    inputId = inputId,
    label = label,
    icon = icon
  )
}

#' Dracula numeric input
#'
#' @inheritParams shiny::numericInput
#'
#' @export
#' @rdname numeric-input
#' @seealso \url{https://ui.draculatheme.com/input} for all
#' available options.
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
#'
#'  # Update numeric #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update numeric"),
#'   dracula_numeric(
#'     "numeric",
#'     "My numeric input",
#'     200,
#'     min = 10,
#'     max = 1000,
#'     step = 1,
#'     color = "orange"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_numeric(
#'        "numeric",
#'        label = "New label",
#'        value = 30,
#'        min = 0,
#'        max = 100,
#'        step = 10
#'      )
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

#' Update dracula numeric input
#'
#' @inheritParams shiny::updateNumericInput
#'
#' @return Send message to JavaScript
#' @export
#' @rdname numeric-input
update_dracula_numeric <- function(
    inputId,
    label = NULL,
    value = NULL,
    min = NULL,
    max = NULL,
    step = NULL,
    session = getDefaultReactiveDomain()
) {
  shiny::updateNumericInput(
    session = session,
    inputId = inputId,
    label = label,
    value = value,
    min = min,
    max = max,
    step = step
  )
}

dracula_select_arrow <- function(color) {
  tags$div(
    class = sprintf(
      "drac-select-arrow drac-text-%s",
      color
    ),
    tags$svg(
      viewbox = "0 0 24 24",
      focusable = "false",
      role = "presentation",
      `aria-hidden` = "true",
      tags$path(
        fill = "currentColor",
        d = "M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"
      )
    )
  )
}

#' Dracula select input
#'
#' @inheritParams shiny::selectInput
#' @inheritParams dracula_input
#'
#' @seealso \url{https://ui.draculatheme.com/select}.
#' @export
#' @rdname select-input
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_select(
#'     "select",
#'     "My select input",
#'     colnames(mtcars)
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$select)
#'    })
#'  }
#'  shinyApp(ui, server)
#'
#'  # Update select #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update select"),
#'   dracula_select(
#'     "select",
#'     "My select input",
#'     colnames(mtcars)
#'   )
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_select(
#'        "select",
#'        label = "New label",
#'        choices = colnames(iris),
#'        selected = colnames(iris)[2]
#'      )
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_select <- function(
    inputId,
    label,
    choices,
    selected = NULL,
    multiple = FALSE,
    selectize = TRUE,
    width = NULL,
    color = "white",
    textColor = "white",
    size = "md",
    disabled = FALSE,
    outline = FALSE
) {
  select_tag <- selectInput(
    inputId,
    label,
    choices,
    selected,
    multiple,
    selectize,
    width,
    size = NULL
  )

  # Get select tag + selectize script
  select_tag <- tagQuery(select_tag)$
    find("select")$
    parent("div")$
    children()$
    selectedTags()

  # Modify select element
  select_tag[[1]]$attribs$class <- sprintf(
    "drac-select drac-select-%s drac-select-%s",
    color,
    size
  )

  if (outline) {
    select_tag[[1]]$attribs$class <- paste(
      select_tag[[1]]$attribs$class,
      "drac-select-outline"
    )
  }

  if (disabled) {
    select_tag[[1]]$attribs$disabled <- ""
  }

  # Add custom arrow
  select_tag[[1]] <- tags$div(
    style = "position: relative",
    select_tag[[1]],
    dracula_select_arrow(color)
  )

  new_label <- tags$label(
    `for` = inputId,
    class = sprintf("drac-text drac-text-%s", textColor),
    label
  )

  tags$div(
    class = "drac-box",
    new_label,
    tagList(select_tag)
  )
}

#' Update dracula select input
#'
#' @inheritParams shiny::updateSelectInput
#'
#' @return Send message to JavaScript
#' @export
#' @rdname select-input
update_dracula_select <- function(
    inputId,
    label = NULL,
    choices = NULL,
    selected = NULL,
    session = getDefaultReactiveDomain()
) {
  shiny::updateSelectInput(
    session = session,
    inputId = inputId,
    label = label,
    choices = choices,
    selected = selected
  )
}

#' Dracula grouped inputs
#'
#' Internal to create radios and checkboxgroup
#'
#' @inheritParams shiny::radioButtons
#' @inheritParams dracula_input
#'
#' @note inline is not yet handled.
#'
#' @keywords internal
dracula_group_input <- function(
    inputId,
    label,
    choices = NULL,
    selected = NULL,
    inline = FALSE,
    width = NULL,
    choiceNames = NULL,
    choiceValues = NULL,
    type,
    color = "purple",
    textColor = "white",
    size = "xs",
    disabled = FALSE
) {

  tag_func <- if (type == "radio") {
    radioButtons
  } else {
    checkboxGroupInput
  }

  tag <- tag_func(
    inputId,
    label,
    choices,
    selected,
    inline,
    width,
    choiceNames,
    choiceValues
  )

  tagQuery(tag)$
    each(function(tag, index) {
      tag$children[[2]] <- tag$children[[2]]$children
      tag
    })$
    addClass("drac-box")$
    removeClass("form-group shiny-input-container")$
    removeAttrs(c("aria-labelledby", "role"))$
    find(".shiny-options-group")$
    removeClass("shiny-options-group")$
    reset()$
    find("label")$
    removeClass("control-label")$
    addClass(
      sprintf(
        "drac-text drac-text-%s",
        textColor
      )
    )$
    reset()$
    find(sprintf(".%s", type))$
    removeClass(sprintf("%s", type))$
    addClass(sprintf("drac-box drac-m-%s", size))$
    each(function(tag, index) {
      tag$children <- tag$children[[1]]$children
      tag
    })$
    find("input")$
    each(function(tag, index) {
      tag$attribs$disabled <- if (disabled) ""
      tag$attribs$class <- sprintf(
        "drac-%s drac-%s-%s",
        type,
        type,
        color
      )
    })$
    reset()$
    find("span")$
    each(function(tag, index) {
      tag$name <- "label"
      tag$attribs$class <- sprintf(
        "drac-text drac-text-%s",
        textColor
      )
    })$
    allTags()
}

#' Dracula radio button
#'
#' @inheritParams dracula_group_input
#'
#' @seealso \url{https://ui.draculatheme.com/radio}.
#' @export
#' @rdname dracula-radio
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_radio(
#'     "radio",
#'     "My radio input",
#'     colnames(mtcars)
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$radio)
#'    })
#'  }
#'  shinyApp(ui, server)
#'
#'  # Update radio #
#'  ui <- dracula_page(
#'   dracula_button("go", "Update radio"),
#'   dracula_radio(
#'     "radio",
#'     "My radio input",
#'     colnames(mtcars)
#'   )
#'  )
#'  server <- function(input, output, session) {
#'    observeEvent(input$go, {
#'      update_dracula_radio(
#'        "radio",
#'        label = "New label",
#'        choices = colnames(iris),
#'        selected = colnames(iris)[2]
#'      )
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_radio <- function(
    inputId,
    label,
    choices = NULL,
    selected = NULL,
    inline = FALSE,
    width = NULL,
    choiceNames = NULL,
    choiceValues = NULL,
    color = "purple",
    textColor = "white",
    size = "xs",
    disabled = FALSE
) {
  dracula_group_input(
    inputId,
    label,
    choices,
    selected,
    inline,
    width,
    choiceNames,
    choiceValues,
    type = "radio",
    color,
    textColor,
    size,
    disabled
  )
}

#' Update dracula radio input
#'
#' @inheritParams shiny::updateRadioButtons
#'
#' @return Send message to JavaScript
#' @export
#' @rdname dracula-radio
update_dracula_radio <- function(
    inputId,
    label = NULL,
    choices = NULL,
    selected = NULL,
    inline = FALSE,
    choiceNames = NULL,
    choiceValues = NULL,
    session = getDefaultReactiveDomain()
) {
  options <- tagQuery(dracula_group_input(
    inputId,
    label,
    choices,
    selected,
    inline,
    width = NULL,
    choiceNames,
    choiceValues,
    type = "radio"
  ))$
    find(".drac-box")$
    selectedTags()

  message <- dropNulls(
    list(
      label = label,
      options = as.character(options),
      value = selected
    )
  )
  session$sendInputMessage(inputId, message)
}

#' Dracula checkbox group
#'
#' @inheritParams dracula_group_input
#'
#' @seealso \url{https://ui.draculatheme.com/checkbox}.
#' @export
#' @rdname dracula-checkbox-group
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_checkbox_group(
#'     "checkbox_group",
#'     "My checkbox group input",
#'     colnames(mtcars)
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$checkbox_group)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_checkbox_group <- function(
    inputId,
    label,
    choices = NULL,
    selected = NULL,
    inline = FALSE,
    width = NULL,
    choiceNames = NULL,
    choiceValues = NULL,
    color = "purple",
    textColor = "white",
    size = "xs",
    disabled = FALSE
) {
  dracula_group_input(
    inputId,
    label,
    choices,
    selected,
    inline,
    width,
    choiceNames,
    choiceValues,
    type = "checkbox",
    color,
    textColor,
    size,
    disabled
  )
}

#' Update dracula checkbox group input
#'
#' @inheritParams shiny::updateRadioButtons
#'
#' @return Send message to JavaScript
#' @export
#' @rdname dracula-checkbox-group
update_dracula_checkbox_group <- function(
    inputId,
    label = NULL,
    choices = NULL,
    selected = NULL,
    inline = FALSE,
    choiceNames = NULL,
    choiceValues = NULL,
    session = getDefaultReactiveDomain()
) {
  options <- tagQuery(dracula_group_input(
    inputId,
    label,
    choices,
    selected,
    inline,
    width = NULL,
    choiceNames,
    choiceValues,
    type = "checkbox"
  ))$
    find(".drac-box")$
    selectedTags()

  message <- dropNulls(
    list(
      label = label,
      options = as.character(options),
      value = selected
    )
  )
  session$sendInputMessage(inputId, message)
}

#' Dracula range input
#'
#' @inheritParams dracula_numeric
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'    dracula_range(
#'     "range",
#'     "My range input",
#'     200,
#'     min = 10,
#'     max = 1000,
#'     step = 1,
#'     color = "orange"
#'    )
#'  )
#'  server <- function(input, output, session) {
#'    observe({
#'     print(input$range)
#'    })
#'  }
#'  shinyApp(ui, server)
#' }
dracula_range <- function(
    inputId,
    label,
    value,
    min,
    max,
    step = NA,
    color = "white",
    textColor = "white",
    size = "md",
    borderSize = "lg"
) {
  # range is just a numeric with different type
  tag <- dracula_numeric(
    inputId,
    label,
    value,
    min,
    max,
    step,
    width = NULL,
    color,
    textColor,
    size,
    outline = FALSE,
    borderSize
  )

  tag$children[[2]] <- tagList(
    tags$div(
      class = "range-value",
      id = sprintf("%s-range-value", inputId)
    ),
    tag$children[[2]]
  )

  tagQuery(tag)$
    addAttrs(style = "position: relative")$
    addClass(sprintf("drac-range-%s", color))$
    find("input")$
    removeAttrs("type")$
    removeClass(sprintf("drac-input-%s", color))$
    removeClass(sprintf("drac-text-%s", color))$
    addAttrs(type = "range")$
    allTags()
}

