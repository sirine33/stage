data_finall<-reactive({
if(input$Annee=="Tous")
{dat_sel1=DATA}
else {dat_sel1=DATA %>% as_tibble() %>%
    filter(DATEA==input$Annee)}
if(input$Gouvernorat=="National")  
{dat_sel2=dat_sel1  }
else {dat_sel2=dat_sel1 %>% as_tibble() %>%
      filter(DGOUVERNORAU==input$Gouvernorat)}    
if(input$Chapitre=="Tous")  
  {dat_sel3=dat_sel2  }
else {dat_sel3=dat_sel2 %>% as_tibble() %>%
    filter(Pathologie_Global==input$Chapitre)}    
 return(dat_sel3) 
  

})  
  
  
  
  
  if (input$Annee=="2020" & input$Gouvernorat=="National" & input$Chapitre=="Tous")
  {data_res=DATAFINAL2}else {
    data_select=DATAFINAL2 %>% as_tibble() %>%
      filter(GOUVERNORAU==input$Gouvernorat & Pathologie_Global==input$Chapitre)
  }
  
  if (input$Annee=="2021" & input$Gouvernorat=="National" & input$Chapitre=="Tous")
  {data_res=DATAFINAL}else {
    data_select=DATAFINAL %>% as_tibble() %>%
      filter(GOUVERNORAU==input$Gouvernorat & Pathologie_Global==input$Chapitre)
  }
  
  if (input$Annee=="Tous" & input$Gouvernorat=="National" & input$Chapitre=="Tous")
  {data_res=DATA}else {
    data_select=DATA %>% as_tibble() %>%
      filter(GOUVERNORAU==input$Gouvernorat & Pathologie_Global==input$Chapitre)
  }
  
  return(data_select)
})
DATA$DATEA