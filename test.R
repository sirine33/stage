library(foreign)
library(plotly)
library(rAmCharts)
base2=read.spss("base2020.sav")
DATAFINAL2=data.frame(base2)
base=read.spss("C:/Users/User1/OneDrive/Bureau/AMAL13.sav")
DATAFINAL=data.frame(base)
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
barplot(DATAFINAL$SEXE,DATAFINAL$classe_age,
        col = c("#1b98e0","353436"),
        beside = TRUE)
sexe_age=data.frame(addmargins(table(DATAFINAL2$SEXE,DATAFINAL2$classe_age)))
sexe_age$pourc=round(sexe_age$Freq/sexe_age$Freq[dim(sexe_age)[1]]*100,1)
sexe_age[-dim(sexe_age)[1],] %>% hchart("pie",hcaes(x =Var1,y=Var2,z=pourc ),name="kkkkk")

cause_age=data.frame(addmargins(table(DATAFINAL2$Pathologie_Global,DATAFINAL2$classe_age)))


gouv_data=data.frame(addmargins(table(DATAFINAL2$GOUVERNORAU)))
gouv_data$pourc=round(gouv_data$Freq/gouv_data$Freq[dim(gouv_data)[1]]*100,1)
amBarplot(x = "Var1", y = "Freq", data = gouv_data, depth = 15, labelRotation = -90)

age_data=data.frame(addmargins(table(DATAFINAL2$classe_age)))
amFunnel(data = age_data, inverse = TRUE)

gouv_data=data.frame(addmargins(table(DATA$classe_age)))
gouv_data$pourc=round(gouv_data$Freq/gouv_data$Freq[dim(gouv_data)[1]]*100,1)
amBarplot(x = "Var1", y = "Freq", data = gouv_data, depth = 15, labelRotation = -90)


gouv_data=data.frame(addmargins(table(DATA$classe_age)))
gouv_data$pourc=round(gouv_data$Freq/gouv_data$Freq[dim(gouv_data)[1]]*100,1)
amBarplot(x = "Var1", y = "Freq", data = gouv_data, depth = 15, labelRotation = -90)

sexe_data=data.frame(addmargins(table(DATA$SEXE)))
amPie(data = sexe_data)

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
## sexe et gouvernorat
gouv_data=data.frame(addmargins(table(DATA$SEXE,DATA$GOUVERNORAU)))
gouv_data1=gouv_data[gouv_data$Var2=="Tunis",]
gouv_data1$pourc=round(gouv_data1$Freq/gouv_data1$Freq[dim(gouv_data1)[1]]*100,1)
gouv_data1[-dim(gouv_data1)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage")
##classe age par gouvernorat
gouv_data=data.frame(addmargins(table(DATA$classe_age,DATA$GOUVERNORAU)))
gouv_data1=gouv_data[gouv_data$Var2=="Tunis",]
gouv_data1$pourc=round(gouv_data1$Freq/gouv_data1$Freq[dim(gouv_data1)[1]]*100,1)
amBarplot(x = "Var1", y = "Freq", data = gouv_data1, depth = 15, labelRotation = -90)
## age et sexe par governorat 
sexe_age=data.frame(addmargins(table(DATA$SEXE,DATA$classe_age,DATA$GOUVERNORAU)))
sexe_age2=sexe_age[sexe_age$Var3=="Tunis",]
sexe_ageM=sexe_age2[sexe_age2$Var1=="Masculin",]
dim(sexe_ageM)
sexe_ageF=sexe_age2[sexe_age2$Var1=="Feminin",]
dim(sexe_ageF)
f=cbind(sexe_ageM,sexe_ageF)
colnames(f)=c("SexeM","Age","gouv1","Masculin","SexeF","Age2","gouv2","Feminin")
F1=f[,c(2,4,8)]
amBarplot(x = "Age", y = c("Masculin", "Feminin"), data = F1, 
          groups_color = c("#4682B4", "#8B0000"))
## sexe par gouvernorat et patho 
gouv_data=data.frame(addmargins(table(DATA$SEXE,DATA$GOUVERNORAU,DATA$Pathologie_Global)))
gouv_data1=gouv_data[gouv_data$Var2=="Tunis",]
gouv_data2=gouv_data1[gouv_data1$Var3=="tumeurs",]
gouv_data2$pourc=round(gouv_data2$Freq/gouv_data2$Freq[dim(gouv_data2)[1]]*100,1)
gouv_data2[-dim(gouv_data2)[1],] %>% hchart("pie",hcaes(x =Var1,y=pourc ),name="pourcentage")
## classe age par gouvernorat et patho
gouv_data=data.frame(addmargins(table(DATA$classe_age,DATA$GOUVERNORAU,DATA$Pathologie_Global)))
gouv_data1=gouv_data[gouv_data$Var2=="Tunis",]
gouv_data2=gouv_data1[gouv_data1$Var3=="tumeurs",]
gouv_data2$pourc=round(gouv_data2$Freq/gouv_data2$Freq[dim(gouv_data2)[1]]*100,1)
amBarplot(x = "Var1", y = "Freq", data = gouv_data2, depth = 15, labelRotation = -90)
## classe age et sexe par gouvernorat et patho
sexe_age=data.frame(addmargins(table(DATA$SEXE,DATA$classe_age,DATA$GOUVERNORAU,DATA$Pathologie_Global)))
sexe_age2=sexe_age[sexe_age$Var3=="Tunis",]
sexe_age3=sexe_age2[sexe_age2$Var4=="tumeurs",]
sexe_ageM=sexe_age3[sexe_age3$Var1=="Masculin",]
dim(sexe_ageM)
sexe_ageF=sexe_age3[sexe_age3$Var1=="Feminin",]
dim(sexe_ageF)
f=cbind(sexe_ageM,sexe_ageF)
colnames(f)=c("SexeM","Age","gouv1","path1","Masculin","SexeF","Age2","gouv2","path2","Feminin")
F1=f[,c(2,5,10)]
amBarplot(x = "Age", y = c("Masculin", "Feminin"), data = F1, 
          groups_color = c("#4682B4", "#8B0000"))
## timeserie par rapport le mois de deces et le sexe
sexe_age=data.frame(addmargins(table(DATA$SEXE,DATA$DATEM)))
sexe_ageM=sexe_age[sexe_age$Var1=="Masculin",]
dim(sexe_ageM)
sexe_ageF=sexe_age[sexe_age$Var1=="Feminin",]
dim(sexe_ageF)
f=cbind(sexe_ageM,sexe_ageF)
colnames(f)=c("SexeM","Mois","Masculin","SexeF","Mois2","Feminin")
F1=f[,c(2,3,6)]
data('F1')
amTimeSeries(F1, 'Mois', c('Masculin', 'Feminin'))
## classe age et pathologie globale
sexe_age=data.frame(addmargins(table(DATA$classe_age,DATA$Pathologie_Global)))
amMekko(x = "Var1", y = "Freq", data = sexe_age, legend = TRUE)