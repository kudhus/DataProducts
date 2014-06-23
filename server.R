library(shiny)

shinyServer(function(input, output) {
  inputData <- reactive({
    # if does not upload a file, then generate some random data
    if(is.null(input$InputData)){      
      data(mtcars)
      dat <- mtcars
    }else{
      dat <- read.csv(input$InputData$datapath)   
    }
    return(dat)
  })

  variableNames <- reactive({
    dat <- inputData()
    return(names(dat))
  })

  output$getVarNames <- renderUI({
    selectInput("varName",label='Variable Name',choices=variableNames()) 
  })

  output$plotData <- renderPlot({
    dat <- unlist(inputData()[input$varName])
    hist(dat)
  })

})
