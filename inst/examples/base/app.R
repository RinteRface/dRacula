library(shiny)

ui <- dracula_page(
    HTML(
      '<h1 class="drac-heading drac-heading-2xl drac-text-white">h1</h1>'
    ),
    dracula_card(
      "My first card"
    ),
    dracula_card(
      "My second card",
      color = "yellow",
      borderColor = "yellow",
      variant = TRUE
    ),
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
    dracula_text(
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
    HTML(
      '<div class="drac-box"><select class="drac-select drac-select-white" id="myselect">
        <option value="default" disabled="" selected="">Select option</option>
        <option>Blade</option>
        <option>Buffy</option>
        <option>Lincoln</option>
        <option>Morbius</option>
        <option>Van Helsing</option>
      </select></div>
      '
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
    print(input$myselect)
    print(input$switch)
  })
}

shinyApp(ui, server)
