#header
header <- dashboardHeader(title = "My Dashboard", titleWidth = 300,
                            tags$li(a(href = 'http://www.insp.rns.tn/',
                                      img(src = 'Logo INSP Nouveau.png',
                                          title = "INSP", height = "30px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))


#-------------------------------end header----------------------------------------------------------


#-------------------------------sidebar----------------------------------------------------------

sidebar <- dashboardSidebar(width = 300,


sidebarMenu(
      menuItem("Acceuil", tabName = "acceuil",  icon = icon("home")),
      menuItem("A propos SICD" , tabName = "about", icon = icon("info-sign", lib = "glyphicon")),
      menuItem("Statistique national sur \r les causes de deces", tabName = "stat", icon = icon("stats", lib = "glyphicon")),
        menuItem("Statistique national sur SICD", tabName = "taux", icon = icon("table"))
      ))
#-------------------------------end sidebar----------------------------------------------------------




#-------------------------------BODY----------------------------------------------------------
body <- dashboardBody( 
  skin = "green",

tabItems(
#tab item Acceuil
  tabItem("acceuil",
          includeMarkdown("www/home.md")
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
dashboardPage(skin = "purple", header, sidebar, body)

