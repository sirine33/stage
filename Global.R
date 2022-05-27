
library(tidyverse)
library(shiny)
library(elo)
library(shiny)
library(shinydashboard)
library(foreign)
library(highcharter)
library(tidyverse)







#base=read.spss("AMAL13.sav")
#DATAFINAL=data.frame(base)
##table(DATAFINAL$DATE_NAISSANCE_A)  
##summary(DATAFINAL$DATE_NAISSANCE_A)
##i=which(DATAFINAL$DATE_NAISSANCE_A==9998)
##DATAFINAL$DATE_NAISSANCE_A[i]=NA
##age<- DATAFINAL$DATEA - DATAFINAL$DATE_NAISSANCE_A
##DATAFINAL$age=age
##summary(DATAFINAL$DATEA)##
#View(DATAFINAL)
##summary(DATAFINAL$age)
##table(DATAFINAL$age)

nom= c( "Tunis","Ariana","Ben Arous","Manouba"," Nabeul","Zaghouan",
        "Bizerte","Beja  ","Jendouba","Le Kef","Siliana","Sousse",
        " Monastir","Mahdia","Sfax","Kairouan"," Kasserine","Sidi Bouzid",
        "Gabes","Mednine","Tataouine"," Gafsa","Tozeur","Kebili",
        "Pas de Pr cision")
Annee<- select(DATAFINAL2,DATEA)
region<- select(DATAFINAL2,GOUVERNORAU)
pathG<- select(DATAFINAL2,Pathologie_Global)


