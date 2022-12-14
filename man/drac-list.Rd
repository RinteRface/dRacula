% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components.R
\name{dracula_list}
\alias{dracula_list}
\alias{dracula_list_item}
\title{Dracula list container}
\usage{
dracula_list(..., ordered = FALSE, color = NULL)

dracula_list_item(...)
}
\arguments{
\item{...}{Any text content.}

\item{ordered}{Whether to add numbers. Default to FALSE.}

\item{color}{Items color.
See \url{https://ui.draculatheme.com/orderedlist#properties}.}
}
\value{
An HTML list.

A li element.
}
\description{
Dracula list container

Dracula list item
}
\examples{
if (interactive()) {
  library(shiny)
  library(dRacula)
  ui <- dracula_page(
    dracula_list(
      ordered = TRUE,
      color = "yellow",
      dracula_list_item("Item 1"),
      dracula_list_item("Item 3"),
      dracula_list_item("Item 2")
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui, server)
}
}
