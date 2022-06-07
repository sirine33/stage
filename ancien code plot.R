observe({
  x<-input$Annee
  y<-input$Gouvernorat
  z<-input$Chapitre
  if(x=="2020"){
    
    output$plot3 <- renderAmCharts({
      sexe_age=data.frame(addmargins(table(DATAFINAL2$SEXE,DATAFINAL2$classe_age)))
      sexe_ageM=sexe_age[sexe_age$Var1=="Masculin",]
      dim(sexe_ageM)
      sexe_ageF=sexe_age[sexe_age$Var1=="Feminin",]
      dim(sexe_ageF)
      f=cbind(sexe_ageM,sexe_ageF)
      colnames(f)=c("SexeM","Age","Masculin","SexeF","Age2","Feminin")
      F1=f[,c(2,3,6)]
      amBarplot(x = "Age", y = c("Masculin", "Feminin"), data = F1, 
                groups_color = c("#4682B4", "#8B0000"))
    })
    
  }
  else if(x=="2021") {
    output$plot1 <- renderHighchart({
      sexe_data=data.frame(addmargins(table(DATAFINAL$SEXE)))
      sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
      sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
    })
    output$plot2 <- renderAmCharts({
      gouv_data=data.frame(addmargins(table(DATAFINAL$classe_age)))
      gouv_data$pourc=round(gouv_data$Freq/gouv_data$Freq[dim(gouv_data)[1]]*100,1)
      amBarplot(x = "Var1", y = "Freq", data = gouv_data, depth = 15, labelRotation = -90)
    })
    output$plot3 <- renderAmCharts({
      sexe_age=data.frame(addmargins(table(DATAFINAL$SEXE,DATAFINAL$classe_age)))
      sexe_ageM=sexe_age[sexe_age$Var1=="Masculin",]
      dim(sexe_ageM)
      sexe_ageF=sexe_age[sexe_age$Var1=="Feminin",]
      dim(sexe_ageF)
      f=cbind(sexe_ageM,sexe_ageF)
      colnames(f)=c("SexeM","Age","Masculin","SexeF","Age2","Feminin")
      F1=f[,c(2,3,6)]
      amBarplot(x = "Age", y = c("Masculin", "Feminin"), data = F1, 
                groups_color = c("#4682B4", "#8B0000"))
    })
  }
  else if(x=="Tous"){
    output$plot1 <- renderHighchart({
      sexe_data=data.frame(addmargins(table(DATA$SEXE)))
      sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
      sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage%")
    })
    output$plot2 <- renderAmCharts({
      gouv_data=data.frame(addmargins(table(DATA$classe_age)))
      gouv_data$pourc=round(gouv_data$Freq/gouv_data$Freq[dim(gouv_data)[1]]*100,1)
      amBarplot(x = "Var1", y = "Freq", data = gouv_data, depth = 15, labelRotation = -90)
    }) 
    output$plot3 <- renderAmCharts({
      sexe_age=data.frame(addmargins(table(DATA$SEXE,DATA$classe_age)))
      sexe_ageM=sexe_age[sexe_age$Var1=="Masculin",]
      dim(sexe_ageM)
      sexe_ageF=sexe_age[sexe_age$Var1=="Feminin",]
      dim(sexe_ageF)
      f=cbind(sexe_ageM,sexe_ageF)
      colnames(f)=c("SexeM","Age","Masculin","SexeF","Age2","Feminin")
      F1=f[,c(2,3,6)]
      amBarplot(x = "Age", y = c("Masculin", "Feminin"), data = F1, 
                groups_color = c("#4682B4", "#8B0000"))
    })
  }
  else if(x=="Tous" & y=="Tunis"){
    output$plot1 <- renderHighchart({
      gouv_data=data.frame(addmargins(table(DATA$SEXE,DATA$GOUVERNORAU)))
      gouv_data1=gouv_data[gouv_data$Var2=="Tunis",]
      gouv_data1$pourc=round(gouv_data1$Freq/gouv_data1$Freq[dim(gouv_data1)[1]]*100,1)
      gouv_data1[-dim(gouv_data1)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage")
    })
  }
  
})







