shinyServer(function(input,output){
output$day_selected<-renderInfoBox({
  infoBox("Date;",Sys.Date(),icon = icon("calendar"),color="yellow")})
  observeEvent(input$titleId11, {
    file.show(file.path("www","insp.pdf"))
  })
  observeEvent(input$titleId44, {
    output$boxContentUI44 <- renderUI({
      HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/YL7emxw8OeA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    })
  })

#SELECTIONEE LES DONN2ES POUR ANALYSE  
data_finall<-reactive({
if(input$Annee=="Tous")
{dat_sel1=DATA}
else {dat_sel1=DATA %>% as_tibble() %>%
filter(DATEA==input$Annee)}
if(input$Gouvernorat=="National")  
{dat_sel2=dat_sel1  }
else {dat_sel2=dat_sel1 %>% as_tibble() %>%
filter(GOUVERNORAU==input$Gouvernorat)}    
if(input$Chapitre=="Tous")  
{dat_sel3=dat_sel2  }
else {dat_sel3=dat_sel2 %>% as_tibble() %>%
filter(Pathologie_Global==input$Chapitre)}    
return(dat_sel3) 
})

#tableau dynamique pour sexe
data_sex<-reactive({
res=data.frame(addmargins(table(data_finall()$SEXE)))
res$pourc=round(res$Freq/res$Freq[dim(res)[1]]*100,1)
names(res)=c("SEXE","Nombre","Pourcentage")
return(res)
})
#output tableau sexe
output$tab1<-DT::renderDataTable({data_sex()})
output$plot1 <- renderHighchart({
  data_sex()[-dim(data_sex())[1],] %>% hchart("pie",hcaes(x =SEXE,y=Pourcentage ),name="Pourcentage%")
})
#tableau dynamique pour age
data_age<-reactive({
res=data.frame(addmargins(table(data_finall()$classe_age)))
res$pourc=round(res$Freq/res$Freq[dim(res)[1]]*100,1)
names(res)=c("Age","Nombre","Pourcentage")
return(res)
})
#output tableau age
output$tab2<-DT::renderDataTable({data_age()})
output$plot2 <- renderHighchart({
  data_age()[-dim(data_age())[1],] %>% hchart("column",hcaes(x =Age,y=Pourcentage ),name="Pourcentage%")%>%
    hc_exporting(enabled=TRUE,filename="custom-file-name")%>%
    hc_xAxis(title = list(text = "<b>Age</b>"),categories = c("<1", "1-4","5-14","15-44","46-64","65-74",">=75"), lineWidth = 2, 
             lineColor = rgb(0,0,0)) %>%
    hc_yAxis(title = list(text = "<b>Nombre de deces</b>"), lineWidth= 2, 
             lineColor = rgb(0,0,0), gridLineColor = rgb(0,0,0))
})
#tableau dynamique pour age et sexe
data_age_sexe<-reactive({
res=data.frame(table(data_finall()$classe_age,data_finall()$SEXE))
names(res)=c("Age","Sexe","Nombre")
return(res)
})
#output tableau age et sexe
output$tab3<-DT::renderDataTable({data_age_sexe()})
output$plot3 <- renderHighchart({
data_age_sexe() %>% hchart("column",hcaes(x =Age,y=Nombre,group=Sexe ))%>%
    hc_exporting(enabled=TRUE,filename="custom-file-name")%>%
    hc_xAxis(title = list(text = "<b>Age</b>"),categories = c("<1", "1-4","5-14","15-44","46-64","65-74",">=75"), lineWidth = 2, 
             lineColor = rgb(0,0,0)) %>%
    hc_yAxis(title = list(text = "<b>Nombre de deces</b>"), lineWidth= 2, 
             lineColor = rgb(0,0,0), gridLineColor = rgb(0,0,0))
 
})
#tableau dynamique mois et sexe
data_mois_sexe<-reactive({
  res=data.frame(table(data_finall()$DATEM,data_finall()$SEXE))
  names(res)=c("Mois","Sexe","Nombre")
  return(res)
})
#output tableau mois et sexe
output$tab4<-DT::renderDataTable({data_mois_sexe()})
output$plot4<-renderHighchart({
  data_mois_sexe() %>% hchart("line",hcaes(x =Mois,y=Nombre,group=Sexe )) %>%
    hc_exporting(enabled=TRUE,filename="custom-file-name")%>%
    hc_xAxis(title = list(text = "<b>Mois</b>"),categories = c("Janvier", "Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Decembre"), lineWidth = 2, 
             lineColor = rgb(0,0,0)) %>%
    hc_yAxis(title = list(text = "<b>Nombre de deces</b>"), lineWidth= 2, 
             lineColor = rgb(0,0,0), gridLineColor = rgb(0,0,0))
})
#tableau dynamique mois et age
output$plot5<-renderHighchart({
   hcboxplot(
    var =data_finall()$DATEM,
    x = data_finall()$age,
    outliers = FALSE,
    color = "#2980b9"
  ) %>% 
    hc_chart(type = "column")%>%
    hc_exporting(enabled=TRUE,filename="custom-file-name")%>%
    hc_xAxis(title = list(text = "<b>Mois</b>"),categories = c("Janvier", "Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Decembre"), lineWidth = 2, 
             lineColor = rgb(0,0,0)) %>%
    hc_yAxis(title = list(text = "<b>Age</b>"), lineWidth= 2, 
             lineColor = rgb(0,0,0), gridLineColor = rgb(0,0,0))
  
  
  
  
  
  
  
  
  
  
  
})
###la répartition par gouvernorat
#les données
maps_data<-reactive({
res=data.frame(addmargins(table(data_finall()$GOUVERNORAU)))
i=match(maps_format$Gouvernorat, res$Var1)
i=match(maps_format$Gouvernorat, res$Var1)
maps_format$nombre=res$Freq[i]
maps_format$nombre[which(is.na(maps_format$nombre))]=0
maps_format$Pourcentage=round(maps_format$nombre/maps_format$nombre[dim(maps_format)[1]]*100,1)
return(maps_format)
})
#les maps 
map_pourc_plot<-reactive({
i=match(m_gouv2@data$HASC_1, maps_data()$HASC)
m_gouv2@data$name=maps_data()$Gouvernorat[i]
m_gouv2@data$pourc=maps_data()$nombre[i]
#les pop ups
my_popup <- paste0("<strong>",m_gouv2@data$name,"</strong>"," Nombre de décès:",m_gouv2@data$pourc)
#les maps
pal1 <- colorNumeric(palette = rev(heat.colors(10)),domain = m_gouv2@data$pourc)
h=leaflet(data = m_gouv2) %>% addTiles() %>% addProviderTiles(providers$CartoDB.Positron)%>%
  addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.5,
              color = ~pal1(m_gouv2@data$pourc),popup = my_popup) %>%
  addLegend("bottomright", pal = pal1, values = ~m_gouv2@data$pourc,
            title = "Nombre de décés",labFormat = labelFormat(),opacity = 0.5)   
})
#les outputs
output$tabgouv<-DT::renderDataTable({maps_data()  })
output$plotgouv<-renderLeaflet({print(map_pourc_plot())})

#taux de couverture
output$plot6<-renderAmCharts({
  amSolidGauge(x = 65, text = "%")
})

 
output$frame <- renderUI({
HTML('<iframe width="640" height="360" src="https://www.youtube.com/embed/YL7emxw8OeA" frameborder="0" allow="accelerometer;
         autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
}) 

datasets<-reactive({list(
  "sexe"=data_sex(),"gouvernorat"=maps_data() , "age"=data_age(),"AgeSexe"=data_age_sexe(), "MoiSexe"=data_mois_sexe())
})

output$download_Data<-downloadHandler(
  filename = "data.xlsx",
  content = function(file){
    write.xlsx(datasets(),file,colNames=TRUE,borders="columns")
  })






output$download_rapport<-downloadHandler(
filename="rapport deces.html",
content = function(file){
  src<-normalizePath('Rapport.Rmd')
  owd<-setwd(tempdir())
  on.exit(setwd(owd))
  file.copy(src,'Rapport.Rmd',overwrite = TRUE)
  out<-render("Rapport.Rmd","html_document")
  file.rename(out,file)
})
})

