library(shiny)

ui <- dracula_page(
    HTML(
      '<h1 class="drac-heading drac-heading-2xl drac-text-white">h1</h1>'
    ),
    HTML('<div class="drac-box drac-card drac-bg-purple-cyan drac-p-sm">
  <span class="drac-text drac-line-height drac-text-black">Dracula</span>
</div>'),
    HTML(
      '<div>
  <div
    variant="subtle"
    class="drac-box drac-card drac-card-subtle drac-border-pink drac-bg-pink drac-p-md drac-m-md"
  >
    <span class="drac-text drac-line-height drac-text-pink">Subtle Card</span>
  </div>
</div>
      '
    ),
    dracula_checkbox("checkbox", "My checkbox", color = "pink"),
    HTML(
      '<input
    placeholder="Number"
    type="number"
    id="numeric"
    class="drac-input drac-input-orange drac-text-orange drac-my-sm"
  />
      '
    ),
    HTML(
      '<input
    placeholder="green"
    type="text"
    id="mytext"
    class="drac-input drac-input-green drac-text-green drac-m-xs"
  />'
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
    HTML(
      '<button id="btn" class="action-button drac-btn drac-bg-animated drac-m-sm">Purple Cyan</button>
      '
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
    HTML(
      '<div class="drac-box">
  <input
    type="checkbox"
    name="demo"
    id="switch"
    class="drac-switch drac-checkbox drac-switch-cyan"
    checked=""
  /><label for="demo" class="drac-text drac-text-cyan">Has reflection</label>
</div>
      '
    ),
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
