shinyServer(function(input, output) {
    plotMtcarsReactive <- reactive({
        plotMtcars(input$plot_title)
    })
    plotIrisReactive <- reactive({
        plotIris(input$plot_title)
    })
    callModule(plotDownload, "mtcars", plotMtcarsReactive)
    callModule(plotDownload, "iris", plotIrisReactive)
})
