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

##########################################

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

s1 <- seq(1,10,by=2) ; s1
s2 <- seq(1,10,length=3); s2
x <- c(1,3,8,25,100); x; seq(along = x)

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)

restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))

table(restData$zipGroups,restData$zipCode)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="no")
as.numeric(yesnofac)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

##########################################

library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns

sprCount = lapply(spIns,sum)
sprCount

unlist(sprCount)
sapply(spIns,sum)

library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)

head(spraySums)

##########################################

library(dplyr)
chicago <- readRDS("chicago.rds")
dim(chicago)
head(select(chicago, 1:5))

names(chicago)[1:3]
head(select(chicago, city:dptp))

head(select(chicago, -(city:dptp)))

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)

chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)

tail(select(chicago, date, pm25tmean2), 3)

chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)

tail(select(chicago, date, pm25tmean2), 3)

head(chicago[, 1:5], 3)

chicago <- rename(chicago, dewpoint = dptp, 
                  pm25 = pm25tmean2)
head(chicago[, 1:5], 3)

chicago <- mutate(chicago, 
                  pm25detrend=pm25-mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

chicago <- mutate(chicago, 
                  tempcat = factor(1 * (tmpd > 80), 
                                   labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2), 
          no2 = median(no2tmean2))

chicago <- mutate(chicago, 
                  year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2, na.rm = TRUE), 
          no2 = median(no2tmean2, na.rm = TRUE))

chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% 
    summarize(pm25 = mean(pm25, na.rm = TRUE), 
              o3 = max(o3tmean2, na.rm = TRUE), 
              no2 = median(no2tmean2, na.rm = TRUE))

##########################################

# Urls don't exist
# if(!file.exists("./data")){dir.create("./data")}
# fileUrl1 = "http://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
# fileUrl2 = "http://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
# download.file(fileUrl1,destfile="./data/reviews.csv")
# download.file(fileUrl2,destfile="./data/solutions.csv")
reviews = read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

names(reviews)
names(solutions)

mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)

intersect(names(solutions),names(reviews))
mergedData2 = merge(reviews,solutions,all=TRUE)
head(mergedData2)

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = list(df1,df2,df3)
join_all(dfList)