#' Dracula tabset
#'
#' @inheritParams shiny::tabsetPanel
#' @param color Tab color.
#'
#' @seealso \url{https://ui.draculatheme.com/tabs#}.
#' @export
#'
#' @rdname tabs
dracula_tabs <- function(..., id = NULL, selected = NULL, color = "white") {
  tabset_tag <- tabsetPanel(
    ...,
    id,
    selected,
    type = "tabs"
  )

  tabset_tag <- tagQuery(htmltools:::tagify(tabset_tag))$
    find("ul")$
    removeClass("nav-tabs")$
    addClass(sprintf("drac-tabs drac-tabs-%s", color))$
    find("li")$
    each(function(tag, index) {
      if (!is.null(tag$attribs$class)) {
        tag$attribs$class <- paste(
          tag$attribs$class,
          "drac-tab drac-tab-active"
        )
      } else {
        tag$attribs$class <- "drac-tab"
      }
      tag
    })$
    find("a")$
    addClass("drac-tab-link drac-text")$
    allTags()

  tags$div(
    class = "drac-box",
    tabset_tag$children
  )

}

#' Dracula tab panel
#'
#' @inheritParams shiny::tabPanel
#'
#' @export
#' @rdname tabs
dracula_tab <- function(title, ..., value = title, icon = NULL) {
 tabPanel(title, ..., value, icon)
}
