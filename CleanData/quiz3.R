download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="./data/reviews.csv")
reviews = read.csv("./data/reviews.csv"); 
library(dplyr)

#filteredData <- reviews %>% filter(ACR == 3 & AGS == 6)
agricultureLogical <- reviews$ACR == 3 & reviews$AGS == 6
head(which(agricultureLogical), 3)

##########################################

library(jpeg)
#The following line, didn't work, it destroyed the file, find out why
#download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",destfile="./data/q2q3.jpg")

imageData <- jpeg::readJPEG(source = "./data/q2q3.jpg", native = TRUE)
quantile(imageData,probs=c(0.3,0.8))

##########################################

#The following line, didn't work, it destroyed the file, find out why
#download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",destfile="./data/gdp.csv")
#The following line, didn't work, it destroyed the file, find out why
#download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile="./data/ed.csv")

gdp <- read.csv("./data/gdp.csv", skip = 4, stringsAsFactors = F)
ed <- read.csv("./data/ed.csv", stringsAsFactors = F)

gdp <- gdp %>% filter(!is.na(X.1) & X.1 != "" & !is.na(X) & X != "")

margedData <- merge(ed, gdp, by.x="CountryCode", by.y="X", all = T)
margedData$X.1 <- sapply(margedData$X.1, as.numeric)
orderedData <- arrange(margedData,desc(X.1))
length(orderedData$CountryCode)
orderedData[13,"Short.Name"]

##########################################

HI_OECD <- orderedData %>% filter(Income.Group == "High income: OECD")
HI_NOECD <- orderedData %>% filter(Income.Group == "High income: nonOECD")
mean(HI_OECD$X.1, na.rm = T)
mean(HI_NOECD$X.1, na.rm = T)

##########################################

y <- cut2(orderedData$X.1,g = 5)
table(orderedData$Income.Group,y)