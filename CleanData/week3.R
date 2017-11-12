##########################################

set.seed(13435)
x <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
x
x <- x[sample(1:5),]
x
x$var2[c(1,3)] = NA
x
class(sample(1:5))

x[,1]
x[1]
x[,"var1"]
x[1:2, "var2"]

x[(x$var1 <= 3 & x$var3 > 11),]
x[(x$var1 <= 3 | x$var3 > 15),]

x[which(x$var2 > 8),] #var2 it's different from var1 and 3 'cause of the NAs, needs 'which'
x[(x$var2 > 8),]

sort(x$var1)
sort(x$var1, decreasing = T)
sort(x$var2, na.last = T)

x
x[order(x$var1),]
x[order(x$var1,x$var3),]

library(plyr)
arrange(x, var1)
arrange(x, desc(var1))

x$var4 <- rnorm(5)
x

y <- cbind(x,rnorm(5))
y

##########################################

library (RCurl)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

head(restData,n=3)
tail(restData,n=3)

summary(restData)

str(restData)

quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

table(restData$zipCode,useNA="ifany")

table(restData$councilDistrict,restData$zipCode)

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))

restData[restData$zipCode %in% c("21212","21213"),]

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt

warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

ftable(xt)

fakeData = rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData),units="Mb")

