

shinyServer(function(input,output){
output$day_selected<-renderInfoBox({
  infoBox("Date;",Sys.Date(),icon = icon("calendar"),color="yellow")
})
  observeEvent(input$titleId11, {
    file.show(file.path("www","insp.pdf"))
  })
  observeEvent(input$titleId44, {
    output$boxContentUI44 <- renderUI({
      HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/YL7emxw8OeA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    })
  })

      observe({
        x<-input$Annee
        y<-input$Gouvernorat
        z<-input$Chapitre
        if(x=="2020"){
          output$plot1 <- renderHighchart({
            sexe_data=data.frame(addmargins(table(DATAFINAL2$SEXE)))
            sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
            sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
            
          })
        }
     else if(x=="2021") {
       output$plot1 <- renderHighchart({
       sexe_data=data.frame(addmargins(table(DATAFINAL$SEXE)))
       sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
       sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
       })
     }
        else if(x=="Tous"){
          output$plot1 <- renderHighchart({
            sexe_data=data.frame(addmargins(table(DATA$SEXE)))
            sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
            sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
          })
        }
        
        else if (x=="Tous"){
          output$plot2<-renderHighchart({
            sexe_data=data.frame(addmargins(table(DATA$SEXE)))
            sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
            sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
          })
        }
      })
          
        
        
    
  

 
  output$frame <- renderUI({
    HTML('<iframe width="640" height="360" src="https://www.youtube.com/embed/YL7emxw8OeA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
})
}) 

