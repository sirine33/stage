library(shiny)
library(shinydashboard)
library(foreign)

base=read.spss("C:/Users/User1/OneDrive/Bureau/AMAL13.sav")
DATAFINAL=data.frame(base)

base1=read.spss("C:/Users/User1/OneDrive/Bureau/BASE DECES2020_46420.sav")
DATAFINAL1=data.frame(base1)

View(DATAFINAL1)



dbHeader <- dashboardHeader(title = "My Dashboard",
                            
                            tags$li(a(href = 'http://www.insp.rns.tn/',
                                      img(src = 'insp.png',
                                          title = "INSP", height = "30px"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))


shinyUI(
  
  dashboardPage(
    
    dbHeader,
    dashboardSidebar(
      sidebarMenu(
        menuItem("acceuil", tabName = "acceuil"),
        menuItem("About ISCD" , tabName = "about"),
        menuItem("statistique national", tabName = "stat"),
        menuItem("Taux / indicateurs", tabName = "taux")
      )),
    
    dashboardBody(
      tabItems(
        tabItem("about",
                h4("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
               incididunt ut labore et dolore magna aliqua. Interdum velit euismod in pellentesque
               massa placerat. Proin sagittis nisl rhoncus mattis rhoncus urna neque. Augue interdum
               velit euismod in. Odio aenean sed adipiscing diam. Senectus et netus et malesuada fames
               ac turpis egestas. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo.
               Sapien eget mi proin sed. Viverra ipsum nunc aliquet bibendum enim facilisis gravida.
               Convallis aenean et tortor at risus viverra adipiscing. Et sollicitudin ac orci
               phasellus egestas tellus rutrum tellus. Aliquam id diam maecenas ultricies mi eget "),
                
                h2("Rapport precis"),
                
                box(
                  title = actionLink("titleId11", "rapport sur les causes de deces en Tunisie 2020"), 
                  width = 12, solidHeader = TRUE, status = "primary",
                  uiOutput("boxContentUI11")
                ),
                box(
                  title = actionLink("titleId22", "rapport 2"), 
                  width = 12, solidHeader = TRUE, status = "primary",
                  uiOutput("boxContentUI22")
                  
                  
                ),
                box(
                  title = actionLink("titleId33", "rapport 3"), 
                  width = 12, solidHeader = TRUE, status = "primary",
                  uiOutput("boxContentUI33")
                  
                ),
                h2("Video"),
                box(
                  title = actionLink("titleId44", "video 1"), 
                  width = 12, solidHeader = TRUE, status = "primary",
                  uiOutput("boxContentUI44")
                  
                ),
                
        ),
        tabItem("stat",
           fluidRow(
             box(uiOutput('data'),status = "primary",
                 solidHeader = T,width = 3,
                 selectInput("Data","Data",
                             c("2020" =  "2020",
                               "2021" = "2021"),
                             selected = "2020")),
             tableOutput("DATAFINAL")
           )     
        )
        
        
      ))))
