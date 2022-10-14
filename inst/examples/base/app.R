library(shiny)
library(dRacula)

ui <- dracula_page(
  dracula_heading("Hello World", color = "cyan-green"),
  dracula_card(
    dracula_p(
      "Dracula is an 1897 Gothic horror novel by Irish author Bram Stoker. It
     introduced the character of Count Dracula and established many conventions
     of subsequent vampire fantasy. The novel tells the story of Dracula's
     attempt to move from Transylvania to England so that he may find new blood
     and spread the undead curse, and of the battle between Dracula and Professor
     Abraham Van Helsing.",
     color = "black-secondary",
     weight = "bold",
     size = "lg",
     lineHeight = "xs"
    )
  ),
  dracula_card(
    "My second card",
    color = "yellow",
    borderColor = "yellow",
    outline = TRUE
  ),
  dracula_avatar(
    "https://ui.draculatheme.com/static/images/avatar.png",
    color = "orange"
  ),
  dracula_avatar(
    "https://ui.draculatheme.com/static/images/avatar.png",
    borderSize = "lg"
  ),
  fluidRow(
    column(
      6,
      dracula_badge("Hello World", color = "red"),
    ),
    column(
      6,
      dracula_badge(
        "1",
        color = "red",
        outline = TRUE
      )
    )
  ),
  dracula_divider(),
  dracula_checkbox("checkbox", "My checkbox", color = "pink"),
  dracula_numeric(
    "numeric",
    "My numeric input",
    200,
    min = 10,
    max = 1000,
    step = 1,
    color = "orange"
  ),
  dracula_text_input(
    "mytext",
    "Text input",
    placeholder = "Enter some text here!",
    color = "green"
  ),
  HTML(
    '<input
    placeholder="Range"
    type="range"
    id="slider"
    class="drac-input drac-input-lg drac-input-pink drac-text-pink drac-my-sm"
  />
      '
  ),
  dracula_button(
    "btn",
    "My action button",
    color = "animated"
  ),
  HTML(
    '<div class="drac-box">
  <input
    type="radio"
    name="normal"
    id="radio"
    class="drac-radio drac-radio-purple"
    checked=""
  /><label for="normal" class="drac-text drac-text-white">Likes Garlic</label>
</div>
      '
  ),
  dracula_select(
    "select",
    "My select input",
    colnames(mtcars)
  ),
  dracula_switch("switch", "My switch input", color = "pink"),
  HTML(
  '<ul class="drac-tabs drac-tabs-white">
  <li class="drac-tab drac-tab-active">
    <a class="drac-tab-link drac-text" href="#">Item One</a>
  </li>
  <li class="drac-tab">
    <a class="drac-tab-link drac-text" href="#">Item Two</a>
  </li>
  <li class="drac-tab">
    <a class="drac-tab-link drac-text" href="#">Item Three</a>
  </li>
</ul>'
  )
)


server <- function(input, output, session) {
  observe({
    print(input$checkbox)
    print(input$numeric)
    print(input$mytext)
    print(input$slider)
    print(input$btn)
    print(input$radio)
    print(input$select)
    print(input$switch)
  })
}

shinyApp(ui, server)
