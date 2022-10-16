library(shiny)
library(dRacula)

addResourcePath("www", "www")

ui <- dracula_page(
  dracula_tabs(
    dracula_tab(
      "Components",
      dracula_heading("Hello World", color = "cyan-green"),
      fluidRow(
        column(
          6,
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
          )
        ),
        column(
          6,
          dracula_card(
            "My second card",
            color = "yellow",
            borderColor = "yellow",
            outline = TRUE
          )
        )
      ),
      dracula_divider(),
      fluidRow(
        dracula_avatar(
          "www/bat.png",
          color = "orange"
        ),
        dracula_avatar(
          "https://ui.draculatheme.com/static/images/avatar.png",
          borderSize = "lg"
        )
      ),
      dracula_divider(),
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
            textColor = "red",
            outline = TRUE
          )
        )
      )
    ),
    dracula_tab(
      "Inputs",
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
      dracula_button(
        "btn",
        "My action button",
        color = "animated"
      ),
      dracula_radio(
        "radio",
        "My radio input",
        color = "pink",
        textColor = "yellow",
        colnames(mtcars)
      ),
      dracula_checkbox_group(
        "checkbox_group",
        "My checkbox group input",
        selected = c("weight", "Chick"),
        colnames(ChickWeight)
      ),
      dracula_select(
        "select",
        "My select input",
        colnames(mtcars),
        color = "purple"
      ),
      dracula_switch("switch", "My switch input", color = "pink"),
      dracula_range(
        "range",
        "My range input",
        50,
        min = 0,
        max = 100,
        #step = 10,
        color = "cyan"
      )
    ),
    dracula_tab("tab 3"),
    selected = "Inputs",
    color = "green"#,
    #id = "tabs"
  ),
  dracula_link(href = "https://www.freepik.com/free-vector/halloween-bat-flat-design_9885927.htm?epik=dj0yJnU9U1ZFZ3E5ME5tMURVcG91MFZEM3pwQWdqbmNlQlE1M0UmcD0wJm49RkgzZGRjMm9OQ2t4LTdhQlNrdnI5ZyZ0PUFBQUFBR05LVkFJ#page=2&query=halloween%20bats&position=48&from_view=search", "Image by pikisuperstar on Freepik" )
)


server <- function(input, output, session) {
  observe({
    print(input$checkbox)
    print(input$numeric)
    print(input$mytext)
    print(input$slider)
    print(input$btn)
    print(input$radio)
    print(input$checkbox_group)
    print(input$select)
    print(input$switch)
    print(input$range)
  })
}

shinyApp(ui, server)
