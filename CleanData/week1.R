library(XML)
fileUrl <- "http://www.xmlfiles.com/examples/note.xml"
doc <- xmlTreeParse(fileUrl, useInternal = T)
doc
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode, "//to", xmlValue)
xpathSApply(rootNode, "//from", xmlValue)

###########################################
    
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/rigalves/repos")
class(jsonData)
names(jsonData)
names(jsonData$owner)

myjson <- toJSON(iris, pretty = T)
myjson
iris2 <- fromJSON(myjson)
head(iris2)

###########################################

library(data.table)
set.seed(20)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"),each = 3), z=rnorm(9))
head(DF, 3)
set.seed(20)
DT = data.table(x=rnorm(9), y=rep(c("a","b","c"),each = 3), z=rnorm(9))
head(DT, 3)
class(DT)

tables()

DT[2,]
DF[2,]
DT[DT$y=='a',]
DF[DF$y=='a',]

DT[c(2,3)]
DF[c(2,3)]

DT[,c(2,3)]
DF[,c(2,3)]

DT[,list(mean(x), sum(z))]
DT[,table(y)]

DT[,w:=z^2]
DT

DT2 <- DT
DT[,y:=2]
head(DT, n=3)
head(DT2, n=3)

DT[,m:= {tmp <- (x+z); log2(tmp+5)}]
DT

DT[,a:=x > 0]
DT

set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, T))
DT[, .N, by=x]

DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

DT1 <- data.table(x=c("a", "a", "b", "dt1"), y=1:4)
DT1
DT2 <- data.table(x=c("a", "b", "dt2"), z=5:7)
DT2
setkey(DT1, x)
setkey(DT2, x)
merge(DT1, DT2)