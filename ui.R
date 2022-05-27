#header
header <- dashboardHeader(title = "My Dashboard",
                            tags$li(a(href = 'http://www.insp.rns.tn/',
                                      img(src = 'Logo INSP Nouveau.png',
                                          title = "INSP", height = "30px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))


#-------------------------------end header----------------------------------------------------------


#-------------------------------sidebar----------------------------------------------------------

sidebar <- dashboardSidebar(width = 300,
                            tags$style(HTML(".fa { font-size: 20px; }")),

sidebarMenu(
      menuItem("acceuil", tabName = "acceuil"),
      menuItem("A propos SICD" , tabName = "about"),
      menuItem("statistique national sur \r les causes de deces", tabName = "stat"),
        menuItem("statistique national sur SICD", tabName = "taux")
      ))
#-------------------------------end sidebar----------------------------------------------------------




#-------------------------------BODY----------------------------------------------------------
body <- dashboardBody( 

tabItems(
#tab item Acceuil
  tabItem("Acceuil",
      h2("Bienvenue !"),
      h3("Ce dashboard a  dans le cadre d un projet de collaboration entre le Fonds des
Nations Unies pour la population et l Institut National de la Sante (INSP)- Ministere de la
Sante, qui vise a appuyer l INSP dans le renforcement des competences de l unite de
codification des causes de deces ainsi que la sensibilisation de la
popultion generale sur l importance de l enregistrement et de la certification
medicale des deces, et l amelioration de la collecte des certificats de deces."),
      fluidRow(
        htmlOutput("frame")
      )
  ),
#tab item about
tabItem("about",
        h4("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
        incididunt ut labore et dolore magna aliqua. Interdum velit euismod in pellentesque
         "),      
        h2("Rapport precis"),
                
        box(title = actionLink("titleId11", "rapport sur les causes de deces en Tunisie 2020"), 
            width = 12, solidHeader = TRUE, status = "primary"),
        box(title = actionLink("titleId22", "rapport sur les causes de deces en Tunisie 2015 et 2017"), 
            width = 12, solidHeader = TRUE, status = "primary",uiOutput("boxContentUI22")),
        box(title = actionLink("titleId33", "rapport sur les causes de deces en Tunisie 2013"), 
            width = 12, solidHeader = TRUE, status = "primary",uiOutput("boxContentUI33") ),
        h2("Video"),
        box(title = actionLink("titleId44", "video 1"), width = 12, solidHeader = TRUE,
         status = "primary",uiOutput("boxContentUI44") ),
        h2("Photos"),
        fluidRow(column(width = 4,img(src="insp.png",height="200px",width="200px")),
                column(width = 4,img(src="sante.png",height="200px",width="200px")),)
                
        ),#end tab item about
tabItem("stat",
        fluidRow( 
            box(title = "Dowload power point rapport ",status = "primary", solidHeader = TRUE,collapsible = TRUE,  downloadButton("download_powerpoint", "Download Graph PowerPoint")),
            box(title = "Dowload data excel ",status = "primary", solidHeader = TRUE,collapsible = TRUE,  downloadButton("download_Data", "Download data excel"),infoBoxOutput("day_selected")) ),
        fluidRow(
          box(title = "Etat global",status = "warning", solidHeader = TRUE,width = "auto",height = "auto",collapsible = TRUE,tableOutput("TabAA"))),




        fluidRow(box(title="filter par",status = "primary",solidHeader = T,width ="auto",
          box(solidHeader = T,width = 3,selectInput("Annee","Annee sele",c(Annee))),
          box(solidHeader = T,width = 3,selectInput("Gouvernorat","gouvernorat",c(region))),
          box(solidHeader = T,width = 3,selectInput("Chapitre","Chapitre de deces",c(pathG))),
        )
        ),
        
        fluidRow(box(title="Repartition selon sous chapitre",status = "primary",solidHeader = T,width ="auto",tableOutput("tab11"))),
        fluidRow(box(title="Repartition selon sous chapitre",status = "primary",solidHeader = T,width ="auto",highchartOutput("plot1"))),
        
        
        
        
        
        
        
        
      )#end item stat

)#end tab items
)#end body
#-------------------------------END BODYs----------------------------------------------------------

#-------------------------------UI FINAL----------------------------------------------------------
dashboardPage(header, sidebar, body)

