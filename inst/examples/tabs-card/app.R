library(shiny)
library(dRacula)
ui <- dracula_page(
  dracula_card(
    dracula_p(
      color = "black-secondary",
      weight = "bold",
      size = "lg",
      lineHeight = "xs",
      dracula_tabs(
        color = "black",
        dracula_tab(
          title = "Card tab1",
          dracula_text("Hello tab 1", color = "black")
        ),
        dracula_tab(
          title = "Card tab2",
          dracula_text("Hello tab 2", color = "black")
        )
      )
    )
  )
)
server <- function(input, output, session) {
  observeEvent(input$go, {
    update_dracula_select(
      "numeric",
      label = "New label",
      choices = colnames(iris),
      selected = colnames(iris)[2]
    )
  })
}
shinyApp(ui, server)
