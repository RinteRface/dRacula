% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inputs.R
\name{dracula_numeric}
\alias{dracula_numeric}
\alias{update_dracula_numeric}
\title{Dracula numeric input}
\usage{
dracula_numeric(
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
)

update_dracula_numeric(
  inputId,
  label = NULL,
  value = NULL,
  min = NULL,
  max = NULL,
  step = NULL,
  session = getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{The \code{input} slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{value}{Initial value.}

\item{min}{Minimum allowed value}

\item{max}{Maximum allowed value}

\item{step}{Interval to use when stepping between min and max}

\item{width}{The width of the input, e.g. \code{'400px'}, or \code{'100\%'};
see \code{\link[shiny:validateCssUnit]{validateCssUnit()}}.}

\item{session}{The \code{session} object passed to function given to
\code{shinyServer}. Default is \code{getDefaultReactiveDomain()}.}
}
\value{
Send message to JavaScript
}
\description{
Dracula numeric input

Update dracula numeric input
}
\examples{
if (interactive()) {
 library(shiny)
 library(dRacula)
 ui <- dracula_page(
   dracula_numeric(
    "numeric",
    "My numeric input",
    200,
    min = 10,
    max = 1000,
    step = 1,
    color = "orange"
   )
 )
 server <- function(input, output, session) {
   observe({
    print(input$numeric)
   })
 }
 shinyApp(ui, server)

 # Update numeric #
 ui <- dracula_page(
  dracula_button("go", "Update numeric"),
  dracula_numeric(
    "numeric",
    "My numeric input",
    200,
    min = 10,
    max = 1000,
    step = 1,
    color = "orange"
  )
 )
 server <- function(input, output, session) {
   observeEvent(input$go, {
     update_dracula_numeric(
       "numeric",
       label = "New label",
       value = 30,
       min = 0,
       max = 100,
       step = 10
     )
   })
 }
 shinyApp(ui, server)
}
}
\seealso{
\url{https://ui.draculatheme.com/input} for all
available options.
}
