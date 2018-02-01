shinyUI(fluidPage(
    title = "app title",
    textInput("plot_title", "title for both plots"),
    plotDownloadUI("mtcars"),
    plotDownloadUI("iris")
))
