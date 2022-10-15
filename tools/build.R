library(sass)

# To compile CSS
sass(
  list(
    draculaColors = c("white", "cyan", "green", "orange", "pink", "purple", "red", "yellow"),
    sass_file("inst/dRacula-0.0.0.9000/scss/range.scss")
  ),
  "inst/dRacula-0.0.0.9000/css/dRacula.min.css",
  options = sass_options(
    #output_style = "compressed", # compress does not work ...
    source_map_embed = TRUE
  )
)
