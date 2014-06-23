library(shiny)

shinyUI(fluidPage(
  titlePanel("Dynamic Histogram Plotter"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select data to upload or use default mtcars."),
      fileInput("InputData",
                label="Select data file",
                multiple=FALSE,
                accept=c('text/csv','text/coma-separated-values,text/plain')),
      uiOutput('getVarNames')
    ),
    
    mainPanel(
      plotOutput("plotData")
      )
  )
))