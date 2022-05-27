addmargins(table(
  
))

  
sexe_data=data.frame(addmargins(table(DATAFINAL$SEXE)))
sexe_data$pourc=round(sexe_data$Freq/sexe_data$Freq[dim(sexe_data)[1]]*100,1)
library(ggplot2)
library(highcharter)
library(tidyverse)
sexe_data[-dim(sexe_data)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="kkkkk")
library(DT)
datatable(sexe_data)


table(DATAFINAL$DATE_NAISSANCE_A)  
summary(DATAFINAL$DATE_NAISSANCE_A)
i=which(DATAFINAL$DATE_NAISSANCE_A==9998)
DATAFINAL$DATE_NAISSANCE_A[i]=NA
age<- DATAFINAL$DATEA - DATAFINAL$DATE_NAISSANCE_A
DATAFINAL$age=age
fix(DATAFINAL)
summary(DATAFINAL$DATEA)
classe_age=cut(DATAFINAL$age,c(0,1,4,14,44,64,74,150),include.lowest = TRUE,labels=c("<1","1-4","5-14","15-44","45-64","65-74",">=75"))
DATAFINAL$classe_age=classe_age
table(DATAFINAL$age,DATAFINAL$classe_age)
Sys.Date()
table(DATAFINAL$classe_age)


Annee<- select(DATAFINAL2,DATEA)
region<- select(DATAFINAL2,GOUVERNORAU)
pathG<- select(DATAFINAL2,CAUSE_SOUS_JACENTE)