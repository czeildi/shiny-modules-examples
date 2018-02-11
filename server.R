shinyServer(function(input, output) {
    plotMtcarsReactive <- reactive({
        plotMtcars(input$sample_ratio)
    })
    plotIrisReactive <- reactive({
        plotIris(input$sample_ratio)
    })
    callModule(plotDownload, "mtcars", plotMtcarsReactive)
    callModule(plotDownload, "iris", plotIrisReactive)
})
