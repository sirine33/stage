library(rmarkdown)
library(openxlsx)
library(elo)
library(shiny)
library(shinydashboard)
library(foreign)
library(highcharter)
library(tidyverse)
library(DT)
library(rAmCharts)
library(data.table)
library(leaflet)
library(fontawesome)
library(raster)
library(readxl)
library(rAmCharts)
DATA=read.csv("DATA.csv")
maps_format<- read_excel("data_map.xlsx")
m_gouv2<- getData(name="GADM",  country="TUN", level=1) 



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
Annee<-unique(DATA$DATEA)
region<- unique(DATA$GOUVERNORAU)
pathG<- unique(DATA$Pathologie_Global)

