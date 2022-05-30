library(foreign)
f = read.csv(file = file.choose())
x = c(1,2,3,4,5,6,7,8,9,10,11,12)
y = c(table(f$month))
Data = data.frame(x,y)
plot(Data)
D=lm(y ~ x,data=Data)
abline(D,col="red")
b = c(13,14,15,16,17,18)
pred = data.frame(x=b)
c=as.integer(predict(D,newdata = pred))
plot(data.frame(c(x,b),c(y,c)))
abline(D,col="red")
lines(b, c, type = "l", lty = 1)



s = list(Homme=1,Femme=2,NonPrecis=9)
l = list(diabète=1052, cérébrovasculaires=1069, Covid=1902, ischémiques=1067, externes=1103)
t = subset(f, Pathologie %in% l$diabète)
#t = subset(f,Pathologie %in% l$externes)
x = c(1,2,3,4,5,6,7,8,9,10,11,12)
y = c(table(t$month))
Data = data.frame(x,y)
D=lm(y ~ x,data=Data)
b = c(13,14,15,16,17,18)
pred = data.frame(x=b)
c = as.integer(predict(D,newdata = pred))
plot(data.frame(c(x,b),c(y,c)))
abline(D,col="red")
lines(b, c, type = "l", lty = 1)








