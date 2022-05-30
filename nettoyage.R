base=read.spss("AMAL13.sav")
DATAFINAL=data.frame(base)
base2=read.spss("base2020.sav")
DATAFINAL2=data.frame(base2)
##view(DATAFINAL)
summary(DATAFINAL$DATEA)
table(DATAFINAL$DATE_NAISSANCE_A)  
summary(DATAFINAL$DATE_NAISSANCE_A)
i=which(DATAFINAL$DATE_NAISSANCE_A==9998)
DATAFINAL$DATE_NAISSANCE_A[i]=NA
fix(DATAFINAL)
age<- DATAFINAL$DATEA - DATAFINAL$DATE_NAISSANCE_A
DATAFINAL$age=age
## age pour base 2020
i=which(DATAFINAL2$DATE_NAISSANCE_A==9998)
DATAFINAL2$DATE_NAISSANCE_A[i]=NA
age<- DATAFINAL2$DATEA - DATAFINAL2$DATE_NAISSANCE_A
DATAFINAL2$age=age
fix(DATAFINAL2)
##classe age pour 2021
summary(DATAFINAL$DATEA)
classe_age=cut(DATAFINAL$age,c(0,1,4,14,44,64,74,150),include.lowest = TRUE,labels=c("<1","1-4","5-14","15-44","45-64","65-74",">=75"))
DATAFINAL$classe_age=classe_age
table(DATAFINAL$age,DATAFINAL$classe_age)
Sys.Date()
#Ajout des variables
AgeAnalyse<-NA
DATAFINAL$AgeAnalyse=AgeAnalyse
VAR00001<-NA
DATAFINAL$VAR00001=VAR00001
cancer<-NA
DATAFINAL$cancer=cancer
cancer_C<-NA
DATAFINAL$cancer_C=cancer_C
AVP<-NA
DATAFINAL$AVP=AVP
Pathologie<-NA
DATAFINAL$Pathologie=Pathologie
Pathologie_Global<-NA
DATAFINAL$Pathologie_Global=Pathologie_Global
Pathologie_Jev<-NA
DATAFINAL$Pathologie_Jev=Pathologie_Jev
Pathologie_Jev_Global<-NA
DATAFINAL$Pathologie_Jev_Global=Pathologie_Jev_Global
COLLECTIVITE_LOCALE<-NA
DATAFINAL$COLLECTIVITE_LOCALE=COLLECTIVITE_LOCALE
COLLECTIVITE_LOCALE_DECES<-NA
DATAFINAL$COLLECTIVITE_LOCALE_DECES=COLLECTIVITE_LOCALE_DECES
N_INSCRIPTION_ORDRE_DES_MEDECINS<-NA
DATAFINAL$N_INSCRIPTION_ORDRE_DES_MEDECINS=N_INSCRIPTION_ORDRE_DES_MEDECINS
SPETIALITE<-NA
DATAFINAL$SPETIALITE=SPETIALITE
NOM_DEMANDEUR<-NA
DATAFINAL$NOM_DEMANDEUR=NOM_DEMANDEUR
CIN_DEMANDEUR<-NA
DATAFINAL$CIN_DEMANDEUR=CIN_DEMANDEUR
VAR00002<-NA
DATAFINAL$VAR00002=VAR00002
CauseModif<-NA
DATAFINAL$CauseModif=CauseModif
DateOfBirth<-NA
DATAFINAL$DateOfBirth=DateOfBirth
DateOfDeath<-NA
DATAFINAL$DateOfDeath=DateOfDeath
Age_Days<-NA
DATAFINAL$Age_Days=Age_Days
Age_years<-NA
DATAFINAL$Age_years=Age_years
Sous_Chapitre<-NA
DATAFINAL$Sous_Chapitre=Sous_Chapitre
chapitre<-NA
DATAFINAL$chapitre=chapitre
PrimaryLast<-NA
DATAFINAL$PrimaryLast=PrimaryLast
DATAFINAL$CONFORME_AU_MODELE<- NULL
DATAFINAL2$classe_age<-NULL
## classe age pour 2020
classe_age=cut(DATAFINAL2$age,c(0,1,4,14,44,64,74,150),include.lowest = TRUE,labels=c("<1","1-4","5-14","15-44","45-64","65-74",">=75"))
DATAFINAL2$classe_age=classe_age

##fusion des données
DATAFINAL<-DATAFINAL[,c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
                        41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,
                        72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,4)]
DATA<- rbind(DATAFINAL2,DATAFINAL)
##
causep<- substr(DATAFINAL$CAUSE_SOUS_JACENTE,1,3)
table(causep)
le=substr(causep,1,1)
ch1=substr(causep,2,2)
ch2=substr(causep,3,3)
DATAFINAL$le=le
DATAFINAL$ch1=ch1
DATAFINAL$ch2=ch2
fix(DATAFINAL)
N=rep(0,length(DATAFINAL$le))
### Certaines maladies infectieuses et parasitaires ###
##Chloéra##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==0 &DATAFINAL$ch2==0)]=1002
##Diarrhée et gastro-entérite d'origine présumée infectieuse##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==0 &DATAFINAL$ch2==9)]=1003
##Autres maladies intestinales infectieuses##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 1:8)]=1004
##Tuberculose de l'appareil respiratoire##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 5:6)]=1005
##Autres formes de tuberculose##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 7:9)]=1006
##Peste##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==2 &DATAFINAL$ch2==0)]=1007
##Tétanos##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 3:5)]=1008
##Diphtérie##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2==6)]=1009
##Coqueluche##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2==7)]=1010
##Infection à méningocoques##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2==9)]=1011
##Septicémie##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:1)]=1012
##Infections dont le mode de transmission est essentiellement sexuel##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1013
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:4)]=1013
##Poliomyélite aigue##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==8 &DATAFINAL$ch2==0)]=1014
##Rage##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==8 &DATAFINAL$ch2==2)]=1015
##Fievre jaune##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==9 &DATAFINAL$ch2==5)]=1016
##Fiévre virales transmises par des arthropodes et fiévres virales hémorragiques##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:4)]=1017
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 6:9)]=1017
##Rougeole##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==0 &DATAFINAL$ch2==5)]=1018
##Hépatite virale##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 5:9)]=1019
##Maladies dues au virus de l'immunodéficience humaine [VIH]##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:4)]=1020
##Paludisme##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:4)]=1021
##Leishmaniose##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==5 &DATAFINAL$ch2==5)]=1022
##Trypanosomiase##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 6:7)]=1023
##Schistosomiase##
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==6 &DATAFINAL$ch2==5)]=1024
##Reste du chapitre de certaines maladies infectieuses et parasitaires##
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 1:9)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:2)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==3 &DATAFINAL$ch2==8)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 5:9)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==8 &DATAFINAL$ch2==1)]=1025
N[which(DATAFINAL$le=="A"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 3:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:4)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 6:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 5:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 8:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:4)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 6:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:4)]=1025
N[which(DATAFINAL$le=="B"& DATAFINAL$ch1==9 &DATAFINAL$ch2==9)]=1025
###Tumeurs###
##Tumeur maligne de la lévre,de la cavité buccale et du pharynx##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1027
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:4)]=1027
##Tumeur maligne de l'oesophage##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==1 &DATAFINAL$ch2==5)]=1028
##Tumeur maligne de l'estomac##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==1 &DATAFINAL$ch2==6)]=1029
##Tumeur maligne du côlon , du rectum et de l'anus##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 8:9)]=1030
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:1)]=1030
##Tumeur maligne du foie et des voies biliaires intrahépatiques##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==2 &DATAFINAL$ch2==2)]=1031
##tumeur maligne du pancréas##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==2 &DATAFINAL$ch2==5)]=1032
##Tumeur maligne du larynx##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==3 &DATAFINAL$ch2==2)]=1033
##Tumeur maligne de la trachée, des bronches et du poumon##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 3:4)]=1034
##Mélanome malin de la peau##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==4 &DATAFINAL$ch2==3)]=1035
##Tumeur maligne du sein##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2==0)]=1036
##Tumeur maligne du col de l'utérus##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2==3)]=1037
##Tumeur maligne de parties de l'utérus,autres et non précisées##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 4:5)]=1038
##Tumeur maligne de l'ovaire##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2==6)]=1039
##Tumeur maligne de la prostate##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==6 &DATAFINAL$ch2==1)]=1040
##Tumeur maligne de vessie##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==6 &DATAFINAL$ch2==7)]=1041
##Tumeur maligne des méninges, du cerveau et d'autres parties du systéme nerveux central##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:2)]=1042
##Lymphome non hodgkinien##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 2:5)]=1043
##Myélome multiple et tumeurs malignes à plasmocytes##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==9 &DATAFINAL$ch2==0)]=1044
##Leucémies##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 1:5)]=1045
##Restant des tumeurs malignes##
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 3:4)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==1 &DATAFINAL$ch2==7)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 6:9)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:1)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 7:9)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:1)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 4:9)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 1:2)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 7:8)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==6 &DATAFINAL$ch2==0)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 2:6)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 8:9)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 3:9)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:1)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==8 &DATAFINAL$ch2==8)]=1046
N[which(DATAFINAL$le=="C"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 6:7)]=1046
##Reste du chapitre des tumeurs##
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1047
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1047
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1047
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1047
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:8)]=1047

### Maladies du sang et des organes hématopoiétiques et certains troubles du système immunitaire
##Anémie
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1049
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:4)]=1049
##Reste du chapitre des Maladies du sang et des organes hématopoiétiques et certains troubles du système immunitaire
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 5:9)]=1050
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1050
N[which(DATAFINAL$le=="D"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1050
### Maladies endocriniennes, nutritionnelles et métaboliques
## Diabète sucré
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:4)]=1052
##Malnutrition 
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:6)]=1053
## Reste du chapitre Maladies endocriniennes, nutritionnelles et métaboliques
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:7)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 5:9)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:4)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1054
N[which(DATAFINAL$le=="E"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:8)]=1054
###Troubles mentaux et du comportement
##Troubles mentaux et du comportement liés à l'utilisation de substances psycho-actives
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1056
##Reste du chapitre Troubles mentaux et du comportement
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 1:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1057
N[which(DATAFINAL$le=="F"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1057
###Maladies  du système nerveux
##Méningites
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:3)]=1059
##Maladie d'Alzheimer
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==3 &DATAFINAL$ch2==0)]=1060
##Reste du chapitre des Maladies  du système nerveux
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 4:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:5)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 1:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1061
N[which(DATAFINAL$le=="G"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:8)]=1061
###Maladies de l'oeil et de ses annexes
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1062
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1062
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1062
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1062
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1062
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:7)]=1062
###Maladies de l'oreille et de l'apophyse mastoide
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1063
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1063
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1063
N[which(DATAFINAL$le=="H"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:3)]=1063
###Maladies de l'appareil circulatoire
##Rhumatisme articulaire aigu et cardiopathies rhumatismales chroniques
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1065
##Maladies hypertensives
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:3)]=1066
##Cardiopathies ischémiques
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:5)]=1067
##Autres cardiopathies
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 6:9)]=1068
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1068
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1068
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:1)]=1068
##Maladiescérébrovasculaires
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1069
##Athérosclérose
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==7 &DATAFINAL$ch2==0)]=1070
##Reste du chapitre des Maladies de l'appareil circulatoire
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 1:9)]=1071
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1071
N[which(DATAFINAL$le=="I"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1071
### Maladies de l'appareil respiratoire
##Grippe
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:1)]=1073
##Pneumopathies
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 2:8)]=1074
##Autres affections aigues des voies respiratoires inférieures 
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:2)]=1075
##Maladies chroniques des voies respiratoires inférieures 
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:7)]=1076
## Reste du chapitre des Maladies de l'appareil respiratoire
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:6)]=1077
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1077
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1077
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1077
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1077
N[which(DATAFINAL$le=="J"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:8)]=1077
###Maladies de l'appareil digestif
##Ulcère de l'estomac et du duodénum
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==2&DATAFINAL$ch2%in% 5:7)]=1079
##Maladies du foie
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:6)]=1080
##Reste du chapitres des Maladies de l'appareil digestif
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:2)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 8:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:6)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1081
N[which(DATAFINAL$le=="K"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:2)]=1081
###Maladies de la peau et du tissu cellulaire sous-cutané
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1082
N[which(DATAFINAL$le=="L"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1082
###Maladies du système ostéo-articulaire, des muscles et du tissu conjonctif
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1083
N[which(DATAFINAL$le=="M"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1083
###Maladies de l'appareil génito-urinaire
##Glomérulopathies et maladies rénales tubulo-interstitielles
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1085
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:5)]=1085
##Reste du chapitre des Maladies de l'appareil génito-urinaire
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 7:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1086
N[which(DATAFINAL$le=="N"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:8)]=1086
###Grossesse, accouchement et puerpéralité
##Grossesse se terminant par un avortement 
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:7)]=1088
##Autres décès maternels directs 
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1089
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:2)]=1089
##Décès maternels indirects 
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 8:9)]=1090
##Reste du chapitre de Grossesse, accouchement et puerpéralité
N[which(DATAFINAL$le=="O"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 5:7)]=1091
###Certaines affections dont l'origine se situe dans la période périnatale
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1092
N[which(DATAFINAL$le=="P"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:6)]=1092
###Malformations congénitales et anomalies chromosomiques
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1093
N[which(DATAFINAL$le=="Q"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1093
###Symtomes, signes et résultats anormaux d'examens cliniques et de laboratoire, non classés ailleurs
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1094
N[which(DATAFINAL$le=="R"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1094
###Causes externes de morbidité et de moralité
##Accidents de transport
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 1:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1096
N[which(DATAFINAL$le=="V"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1096
##Chutes
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1097
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1097
##Noyade et submersion accidentelles
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 5:9)]=1098
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:4)]=1098
##Exposition à la fumée, au feu et aux flammes
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1099
##Intoxication accidentelle par des sustances nocives et exposition à ces substanes
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1100
##Lésions auto-infligées 
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1101
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1101
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:4)]=1101
##Agressions 
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 5:9)]=1102
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1102
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 0:9)]=1102
##Toutes autres causes externes
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:4)]=1103

N[which(DATAFINAL$le=="w"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 5:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="W"& DATAFINAL$ch1==9 &DATAFINAL$ch2%in% 0:9)]=1103

N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1103

N[which(DATAFINAL$le=="X"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1103

N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==2 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==3 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==4 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==5 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==6 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==7 &DATAFINAL$ch2%in% 0:9)]=1103
N[which(DATAFINAL$le=="Y"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 0:9)]=1103

###Codes utilisation particulière
##SARS
N[which(DATAFINAL$le=="U"& DATAFINAL$ch1==0 &DATAFINAL$ch2==4)]=1105
##COVID19
N[which(DATAFINAL$le=="U"& DATAFINAL$ch1==0 &DATAFINAL$ch2%in% 7:9)]=1106
N[which(DATAFINAL$le=="U"& DATAFINAL$ch1==1 &DATAFINAL$ch2%in% 0:2)]=1106
##Agents bactériens résistant aux antibiotiques
N[which(DATAFINAL$le=="U"& DATAFINAL$ch1==8 &DATAFINAL$ch2%in% 2:5)]=1107


PG=rep(0,length(DATAFINAL$N))
### Certaines maladies infectieuses et parasitaires ###
PG[which(DATAFINAL$N%in% 1002:1025)]=1001 
###Tumeurs###
PG[which(DATAFINAL$N%in% 1027:1047)]=1026
### Maladies du sang et des organes hématopoiétiques et certains troubles du système immunitaire
PG[which(DATAFINAL$N%in% 1049:1050)]=1048
### Maladies endocriniennes, nutritionnelles et métaboliques
PG[which(DATAFINAL$N%in% 1052:1054)]=1051
PG[which(DATAFINAL$N%in% 1056:1057)]=1055
PG[which(DATAFINAL$N%in% 1059:1061)]=1058
PG[which(DATAFINAL$N==1062)]=1062
PG[which(DATAFINAL$N==1063)]=1063
PG[which(DATAFINAL$N%in% 1065:1071)]=1064
PG[which(DATAFINAL$N%in% 1073:1077)]=1072
PG[which(DATAFINAL$N%in% 1079:1081)]=1078
PG[which(DATAFINAL$N%in% 1083:1086)]=1082
PG[which(DATAFINAL$N%in% 1088:1091)]=1087
PG[which(DATAFINAL$N==1092)]=1092
PG[which(DATAFINAL$N==1093)]=1093
PG[which(DATAFINAL$N==1094)]=1094
PG[which(DATAFINAL$N%in% 1096:1103)]=1095
PG[which(DATAFINAL$N%in% 1105:1107)]=1104



write.spss(DATAFINAL,"C:\Users\User1\OneDrive\Bureau")