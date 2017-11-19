##########################################

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/mdsurvey.csv")
mdsurvey <- read.csv("./data/mdsurvey.csv")

splitNames = strsplit(names(mdsurvey),"wgtp")
splitNames[123]

##########################################

library(dplyr)

gdp <- read.csv("./data/gdp.csv", skip = 4, stringsAsFactors = F)
gdp <- gdp %>% filter(!is.na(X.1) & X.1 != "" & !is.na(X) & X != "")
strVals <- gsub(",", "", gdp$X.4)
mean(as.numeric(strVals))

##########################################

countryNames <- gdp$X.3
length(grep("^United",countryNames))

##########################################

ed <- read.csv("./data/ed.csv", stringsAsFactors = F)
mergedData <- merge(ed, gdp, by.x="CountryCode", by.y="X", all = T)
countriesWithSpecialNotes <- mergedData %>% filter(!is.na(Special.Notes) & Special.Notes != "")
length(grep("^[Ff]iscal.*[Jj]une",countriesWithSpecialNotes$Special.Notes, value = T))

##########################################

library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = F)
sampleTimes <- index(amzn) 

year2002List <- sampleTimes[year(sampleTimes) == 2012]
length(year2002List)
length(year2002List[weekdays(year2002List, abbreviate = T) == "Mon"])

##########################################
