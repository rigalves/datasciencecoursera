##########################################

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "data.csv")
csvContent <- read.csv('data.csv', sep = ",")
length(na.omit(csvContent$VAL[csvContent$VAL == 24])) 

##########################################

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', destfile = "data3.xlsx", mode='wb')
dat <- read.xlsx(file = 'data3.xlsx', sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

##########################################

library (RCurl)
library (XML)
temp <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", ssl.verifyPeer=FALSE)
doc <- xmlTreeParse(temp, useInternal = T)
rootNode <- xmlRoot(doc)
length(xpathSApply(rootNode, "//row[zipcode = '21231']", xmlValue))

##########################################

library(data.table)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', destfile = "data4.csv")
DT <- fread(file = 'data4.csv');
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
