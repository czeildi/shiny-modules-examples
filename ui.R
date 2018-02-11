shinyUI(fluidPage(
    title = "download ggplot example module",
    numericInput(
        "sample_ratio", "Sample ratio for all plots",
        value = 1, min = 0, max = 1, step = 0.05
    ),
    plotDownloadUI("mtcars"),
    plotDownloadUI("iris")
))
