% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inputs.R
\name{dracula_text_input}
\alias{dracula_text_input}
\alias{update_dracula_text_input}
\title{Dracula text input}
\usage{
dracula_text_input(
  inputId,
  label,
  value = "",
  width = NULL,
  placeholder = NULL,
  color = "white",
  textColor = "white",
  size = "md",
  outline = FALSE,
  borderSize = "lg"
)

update_dracula_text_input(
  inputId,
  label = NULL,
  value = NULL,
  placeholder = NULL,
  session = getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{The \code{input} slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{value}{Initial value.}

\item{placeholder}{A character string giving the user a hint as to what can
be entered into the control. Internet Explorer 8 and 9 do not support this
option.}

\item{color}{Input color.}

\item{textColor}{Text color.}

\item{size}{Input size.}

\item{outline}{Outline variant.}

\item{borderSize}{Border size.}

\item{session}{The \code{session} object passed to function given to
\code{shinyServer}. Default is \code{getDefaultReactiveDomain()}.}
}
\value{
Send message to JavaScript
}
\description{
Dracula text input

Update dracula text input
}
\examples{
if (interactive()) {
 library(shiny)
 library(dRacula)
 ui <- dracula_page(
   dracula_text_input(
    "text",
    "My text input",
    "Hello World",
    color = "orange"
   )
 )
 server <- function(input, output, session) {
   observe({
    print(input$text)
   })
 }
 shinyApp(ui, server)

 # Update input #
 ui <- dracula_page(
  dracula_button("go", "Update text"),
  dracula_text_input(
    "text",
    "My text input",
    "Hello World"
  )
 )
 server <- function(input, output, session) {
   observeEvent(input$go, {
     update_dracula_text_input(
       "text",
       label = "Plop",
       value = "New value",
       placeholder = "New placeholder"
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
