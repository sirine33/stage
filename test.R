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
##x <- c('Product A', 'Product B', 'Product C')
##y <- c(20, 14, 23)
##y2 <- c(16,12,27)
##text <- c('27% market share', '24% market share', '19% market share')
##data <- data.frame(x, y, y2, text)

##fig <- data %>% plot_ly()
##fig <- fig %>% add_trace(x = ~x, y = ~y, type = 'bar',
## text = y, textposition = 'auto',
##marker = list(color = 'rgb(158,202,225)',
## line = list(color = 'rgb(8,48,107)', width = 1.5)))
##fig <- fig %>% add_trace(x = ~x, y = ~y2, type = 'bar',
##text = y2, textposition = 'auto',
## marker = list(color = 'rgb(58,200,225)',
## line = list(color = 'rgb(8,48,107)', width = 1.5)))
##fig <- fig %>% layout(title = "January 2013 Sales Report",
##barmode = 'group',
##  xaxis = list(title = ""),
## yaxis = list(title = ""))

##fig
