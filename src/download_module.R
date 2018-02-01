plotDownloadUI <- function(id, height = 400) {
    ns <- NS(id)
    tagList(
        fluidRow(
            plotOutput(ns('plot'), height = height)
        ),
        fluidRow(
            column(
                2, offset = 10,
                downloadButton(ns("download_plot"), "Download figure")
            )
        )
    )
}

plotDownload <- function(input, output, session, plotFun, reactive_title) {
    output$plot <- renderPlot({
        plotFun(reactive_title())
    })
    
    output$download_plot <- downloadHandler(
        filename = function() {
            "plot.png"
        },
        content = function(file) {
            ggsave(file, plotFun(reactive_title()), width = 16, height = 10.4)
        }
    )
}

plotMtcars <- function(title) {
    ggplot(mtcars, aes(x = cyl, y = mpg)) + 
        geom_point() + 
        ggtitle(title)
}

plotIris <- function(title) {
    ggplot(iris, aes(x = Sepal.Width, y = Petal.Length)) + 
        geom_point() + 
        ggtitle(title)
}
