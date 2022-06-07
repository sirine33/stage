#header
header <- dashboardHeader(title = "Les causes de décès en Tunisie", titleWidth = 330,
                          dropdownMenu(type = "notifications", headerText = strong("HELP"), icon = icon("question"), badgeStatus = NULL,
                                       notificationItem(text = "A propos INSP",icon = icon("spinner"), href = "http://www.insp.rns.tn/" ),
                                       notificationItem(text = "contact",icon = icon("address-card") ), href = 
                                       notificationItem(text = "INSP FB",icon = icon("facebook"),href = "https://www.facebook.com/insp2015" ),
                                       notificationItem(text = "Ministere de la sante", icon = icon("ambulance"),href = "http://www.santetunisie.rns.tn/fr/" )
                                       
                          ),
                            tags$li(a(href = 'http://www.santetunisie.rns.tn/fr/',
                                      img(src = 'sante.png',
                                          title = "Ministere de sante", height = "30px" , width="50px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))


#-------------------------------end header----------------------------------------------------------


#-------------------------------sidebar----------------------------------------------------------

sidebar <- dashboardSidebar(width = 330, 


sidebarMenu(
  HTML(paste0(
    "<br>",
    "<a href='http://www.insp.rns.tn/' target='_blank'><img style = 'display: block; margin-left: auto; margin-right: auto;' src='insp.png' width = '200'></a>",
    "<br>"
    
  )),
      menuItem("Acceuil", tabName = "acceuil",  icon = icon("home")),
      menuItem("A propos SICD" , tabName = "about", icon = icon("info-sign", lib = "glyphicon")),
      menuItem("Statistique national sur \r les causes de deces", tabName = "stat", icon = icon("stats", lib = "glyphicon")),
        menuItem("Statistique national sur SICD", tabName = "taux", icon = icon("table")),
  HTML(paste0(
    "<br><br><br><br><br><br><br><br><br>",
    "<table style='margin-left:auto; margin-right:auto;'>",
    "<tr>",
    "<td style='padding: 5px;'><a href='https://www.facebook.com/insp2015' target='_blank'><i class='fab fa-facebook-square fa-lg'></i></a></td>",
    "<td style='padding: 5px;'><a href='https://www.youtube.com/channel/UCxZZEEy8D0WzXg-NjRkhzaQ/videos' target='_blank'><i class='fab fa-youtube fa-lg'></i></a></td>",
    "<td style='padding: 5px;'><a href='rtsp@rns.tn' target='_blank'><i class='fa fa-envelope-o fa-lg'></i></a></td>",
    "<td style='padding: 5px;'><a href='https://github.com/sirine33/stage' target='_blank'><i class='	fab fa-github fa-lg'></i></a></td>",
    "</tr>",
    "</table>",
    "<br>")
      )))
#-------------------------------end sidebar----------------------------------------------------------




#-------------------------------BODY----------------------------------------------------------
body <- dashboardBody( 

tabItems(
#tab item Acceuil
  tabItem("acceuil",
          includeMarkdown("www/home.md")
  ),
#tab item about
tabItem("about",
        includeMarkdown("www/about.md")
                
        ),#end tab item about
#PARTIE STATISTIQUE NATION AL ANALYSE
tabItem("stat",
        fluidRow( 
            box(title = "Télècharger rapport ",status = "primary", solidHeader = TRUE,collapsible = TRUE,  downloadButton("download_rapport", "Download rapport")),
            box(title = "Télècharger tableau de donnée  ",status = "primary", solidHeader = TRUE,collapsible = TRUE,  downloadButton("download_Data", "Download data excel")) ),
        fluidRow(
          box(title = "Etat global",background = "aqua", solidHeader = TRUE,width = "auto",height = "auto",collapsible = TRUE,dataTableOutput("TabAA"))),




        fluidRow(box(title="Filter par",status = "primary",solidHeader = T,width ="auto",
          box(solidHeader = T,width = 3,selectInput("Annee","Année ",c("Tous",Annee))),
          box(solidHeader = T,width = 3,selectInput("Gouvernorat","Gouvernorat",c("National",region))),
          box(solidHeader = T,width = 3,selectInput("Chapitre","Chapitre de décès",c("Tous",pathG))),
        )
        ),
        
 
        fluidRow(
          box(title="Repartition selon le sexe",status = "primary",solidHeader = T,width ="auto",dataTableOutput("tab1")),
          box(title="",solidHeader = F,width ="auto",highchartOutput("plot1"))
          ),
        
        fluidRow(
          box(title="Repartition selon l'age",status = "primary",solidHeader = T,width ="auto",dataTableOutput("tab2")),
          box(title="",solidHeader = F,width ="auto",highchartOutput("plot2"))),
        fluidRow(
          box(title="Repartition selon gouvernorat",status = "primary",solidHeader = T,width ="auto",dataTableOutput("tabgouv")),
          box(title="",solidHeader = F,width ="auto",leafletOutput("plotgouv"))
        ),        
        
        
        fluidRow(
          box(title="Repartition selon  age et sexe",status = "primary",solidHeader = T,width ="auto",dataTableOutput("tab3")),
        box(title="",solidHeader = F,width ="auto",highchartOutput("plot3"))
),        

        fluidRow(
          box(title="Repartition selon  mois et sexe",status = "primary",solidHeader = T,width ="auto",dataTableOutput("tab4")),
          box(title="",solidHeader = F,width ="auto",highchartOutput("plot4"))
        ), 
fluidRow(
  box(title="Repartition selon  mois et age",status = "primary",solidHeader = T,width ="auto",highchartOutput("plot5")),
), 
         
        
        
        
      
        
        
        
      ),#end item stat
#tab item taux
tabItem("taux",
        fluidRow(box(title="filter par",status = "primary",solidHeader = T,width ="auto",
                     box(solidHeader = T,width = 4,selectInput("Annee1","Annee sele",c("Tous",Annee))),
                     box(solidHeader = T,width = 4,selectInput("Gouvernorat1","gouvernorat",c("National",region)))) ),
        
        fluidRow(
          box(title="Taux de couverture",status = "primary",solidHeader = T,width ="auto",amChartsOutput("plot6")),
        )
        

)#end item taux
)#end tab items
)#end body
#-------------------------------END BODYs----------------------------------------------------------

#-------------------------------UI FINAL----------------------------------------------------------
dashboardPage(skin = "blue", header, sidebar, body)

