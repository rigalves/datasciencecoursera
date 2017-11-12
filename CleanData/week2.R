library(RMySQL)
ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;");
dbDisconnect(ucscDb)
result

##############################

hg19 <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu", db = "hg19")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query);
quantile(affyMis$misMatches)

affyMisSmall <- fetch(query, n = 10);
dbClearResult(query)
dim(affyMisSmall)

dbDisconnect(hg19)

##############################

library(rhdf5)
if(file.exists("example.h5"))
    file.remove("example.h5")
created = h5createFile("example.h5")
created

created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")

A <- matrix(1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")
B <- array(seq(0.1, 2.0, by = 0.1), dim = c(5, 2, 2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

df <- data.frame(1L:5L, seq(0, 1, length.out = 5), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = F)
h5write(df, "example.h5", "df")
h5ls("example.h5")

readA <- h5read("example.h5", "foo/A")
readB <- h5read("example.h5", "foo/foobaa/B")
readdf <- h5read("example.h5", "df")
readA
readB
readdf

h5write(c(12, 13, 14), "example.h5", "foo/A", index = list(1:3, 1))
h5read("example.h5", "foo/A")