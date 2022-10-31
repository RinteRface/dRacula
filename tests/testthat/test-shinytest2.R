test_that("{shinytest2} recording: base", {
  app <- shinytest2::AppDriver$new(
    app_dir = system.file("examples/base", package = "dRacula"),
    variant = shinytest2::platform_variant(),
    name = "base",
    height = 771,
    width = 766
  )
  app$set_inputs(checkbox = TRUE)
  app$expect_values()
  app$set_inputs(numeric = 100)
  app$expect_values()
  app$set_inputs(mytext = "Blabla")
  app$expect_values()
  app$click("btn")
  app$expect_values()
  app$set_inputs(radio = "hp")
  app$expect_values()
  app$set_inputs(checkbox_group = c("weight", "Time", "Chick"))
  app$expect_values()
  app$set_inputs(select = "hp")
  app$expect_values()
  app$set_inputs(switch = TRUE)
  app$expect_values()
})
