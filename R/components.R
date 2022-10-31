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
#' @seealso \url{https://ui.draculatheme.com/card}
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

  card_cl <- paste(
    sprintf(
      "drac-box drac-card drac-bg-%s drac-p-%s drac-m-%s",
      color,
      size,
      size
    ),
    sprintf(
      "drac-rounded-%s drac-h-%s drac-w-%s drac-scrollbar-%s",
      rounded,
      height,
      width,
      scrollbar
    )
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
#' @param textColor text color.
#'
#' @seealso \url{https://ui.draculatheme.com/badge}.
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
#'     textColor = "red",
#'     outline = TRUE
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_badge <- function(..., color = "purple", textColor = "black",
                          outline = FALSE) {

  badge_tag <- tags$span(
    class = "drac-badge drac-m-sm drac-p-sm",
    # necessary to fix a bug in dracula UI
    # .drac-badge {
    #   /* background-color: var(--accentColor); ## WRONG!!! ##
    style = if (!outline) sprintf("background-color: var(--%s);", color),
    tags$span(
      class = sprintf(
        "drac-text drac-line-height drac-text-%s",
        textColor
      ),
      ...
    )
  )

  if (outline) {
    tagQuery(badge_tag)$
      addClass(
        sprintf(
          "drac-badge-subtle drac-bg-%s-transparent drac-text-%s",
          color,
          textColor
        )
      )$
      allTags()
  } else {
    tagQuery(badge_tag)$
      addClass(sprintf("drac-bg-%s", color))$
      allTags()
  }
}

#' Dracula divider
#'
#' @inheritParams dracula_card
#' @export
dracula_divider <- function(color = "purple") {
  tags$div(
    class = "drac-box drac-m-sm drac-p-sm",
    tags$hr(
      class = sprintf(
        "drac-divider drac-border-%s",
        color
      )
    )
  )
}

#' Dracula avatar
#'
#' @inheritParams dracula_badge
#' @param src Background image path.
#' @param borderSize Border size.
#' @seealso See \url{https://ui.draculatheme.com/avatar#properties}.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(dRacula)
#'  ui <- dracula_page(
#'   dracula_avatar(
#'     "https://ui.draculatheme.com/static/images/avatar.png",
#'     color = "green"
#'   ),
#'   dracula_avatar(
#'     "https://ui.draculatheme.com/static/images/avatar.png",
#'     borderSize = "lg"
#'   )
#'  )
#'  server <- function(input, output, session) {
#'  }
#'  shinyApp(ui, server)
#' }
dracula_avatar <- function(src, color = "purple",
                           borderSize = "md") {

  base_cl <- "drac-avatar drac-m-sm"

  tags$span(
    class = sprintf(
      "%s drac-bg-%s-transparent drac-text-%s drac-avatar-%s-stroke",
      base_cl,
      color,
      color,
      borderSize
    ),
    tags$span(
      class = "drac-avatar-background",
      style = sprintf("background-image: url(%s);", src)
    )
  )
}

#' Dracula list container
#'
#' @param ... Slot for \link{dracula_list_item}.
#' @param ordered Whether to add numbers. Default to FALSE.
#' @param color Items color.
#' See \url{https://ui.draculatheme.com/orderedlist#properties}.
#'
#' @return An HTML list.
#' @export
#' @rdname drac-list
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(dRacula)
#'   ui <- dracula_page(
#'     dracula_list(
#'       ordered = TRUE,
#'       color = "yellow",
#'       dracula_list_item("Item 1"),
#'       dracula_list_item("Item 3"),
#'       dracula_list_item("Item 2")
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui, server)
#' }
dracula_list <- function(..., ordered = FALSE, color = NULL) {

  list_func <- if (ordered) tags$ol else tags$ul

  list_cl <- "drac-list"
  if (!is.null(color)) {
    list_cl <- sprintf("%s drac-list-%s", list_cl, color)
  }

  if (ordered) {
    list_cl <- sprintf("%s drac-list-ordered", list_cl)
  }

  tags$div(
    class = "drac-box",
    list_func(
      class = list_cl,
      `drac-list` = NA, # required to avoid an issue with htmtools and tabs.
      ...
    )
  )
}

#' Dracula list item
#'
#' @param ... Any text content.
#'
#' @return A li element.
#' @export
#' @rdname drac-list
dracula_list_item <- function(...) {
  tags$li(class = "drac-text drac-text-white", ...)
}

