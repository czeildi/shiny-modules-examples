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

plotDownload <- function(input, output, session, plotFun) {
    output$plot <- renderPlot({
        plotFun()
    })
    
    output$download_plot <- downloadHandler(
        filename = function() {
            "plot.png"
        },
        content = function(file) {
            ggsave(file, plotFun(), width = 16, height = 10.4)
        }
    )
}

plotMtcars <- function(sample_ratio) {
    mtcars %>% 
        .[sample(nrow(.), floor(nrow(.) * sample_ratio)), ] %>% 
        ggplot(aes(x = cyl, y = mpg)) + 
        geom_point()
}

plotIris <- function(sample_ratio) {
    iris %>% 
        .[sample(nrow(.), floor(nrow(.) * sample_ratio)), ] %>% 
        ggplot(aes(x = Sepal.Width, y = Petal.Length)) + 
        geom_point()
}
