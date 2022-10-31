library(shiny)
library(dRacula)

addResourcePath("www", system.file("dracula-images", package = "dRacula"))

ui <- dracula_page(
  dracula_tabs(
    selected = "Inputs",
    color = "green",
    id = "tabs",
    dracula_tab(
      "Components",
      dracula_heading("Cards", color = "pink-purple"),
      fluidRow(
        column(
          6,
          dracula_card(
            dracula_p(
              "Dracula is an 1897 Gothic horror novel by Irish author Bram Stoker.",
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
            "Secondary outline card",
            color = "yellow",
            borderColor = "yellow",
            outline = TRUE
          )
        )
      ),
      fluidRow(
        column(
          6,
          dracula_card(
            color = "cyan-green",
            dracula_p(
              "Gradient background card.",
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
            color = "animated",
            rounded = "sm",
            dracula_p(
              "Animated background card with small rounded borders.",
              color = "black-secondary",
              weight = "bold",
              size = "lg",
              lineHeight = "xs"
            )
          )
        )
      ),
      dracula_divider(),
      dracula_heading("Avatars", color = "pink-purple"),
      fluidRow(
        dracula_avatar(
          "www/045-dracula.svg",
          color = "orange"
        ),
        dracula_avatar(
          "https://ui.draculatheme.com/static/images/avatar.png",
          borderSize = "lg"
        )
      ),
      dracula_divider(),
      dracula_heading("Badges", color = "pink-purple"),
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
        textColor = "yellow-pink",
        colnames(mtcars)
      ),
      dracula_checkbox_group(
        "checkbox_group",
        "My checkbox group input",
        selected = c("weight", "Chick"),
        colnames(ChickWeight),
        textColor = "purple-cyan"
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
    dracula_tab("tab 3")
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
    print(input$checkbox_group)
    print(input$select)
    print(input$switch)
    print(input$range)
    print(input$tabs)
  })
}

shinyApp(ui, server)
