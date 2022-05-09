library(shiny)
library(shinydashboard)

shinyServer(function(input,output){
  observeEvent(input$titleId11, {
    output$boxContentUI11 <- renderUI({
      tags$iframe( src="insp.pdf")
    })
  })
})