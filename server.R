shinyServer(function(input, output) {
    plot_title <- reactive({input$plot_title})
    callModule(plotDownload, "mtcars", plotMtcars, plot_title)
    callModule(plotDownload, "iris", plotIris, plot_title)
})
