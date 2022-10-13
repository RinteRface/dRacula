library(shiny)

ui <- add_dracula_ui_deps(
  fluidPage(
    # dracula white/black colors
    theme = bslib::bs_theme(
      version = 5,
      bg = "#1d1e26",
      fg = "#f8f8f2",
    ),
    HTML(
      '<h1 class="drac-heading drac-heading-2xl drac-text-white">h1</h1>'
    ),
    HTML('<div class="drac-box drac-card drac-bg-purple-cyan drac-p-sm">
  <span class="drac-text drac-line-height drac-text-black">Dracula</span>
</div>')
  )
)


server <- function(input, output, session) {

}

shinyApp(ui, server)
