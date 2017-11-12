library(httr)
library(RJSONIO)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
<<<<<<< HEAD
                   key = "",
                   secret = "")
=======
                   key = "270a0df990ec0438d1e0",
                   secret = "81ffb57d7b19c2db26637c2286d37c32614e6b1d")
>>>>>>> c1835e86390f37643c764086d366b4ad339f2aae

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

jsonAsList <- content(req)
jsonAsDF <- jsonlite::fromJSON(toJSON(jsonAsList))
jsonAsDF[jsonAsDF$name == 'datasharing','created_at']


################################################

library(sqldf)
acs <- read.csv(file = "acsd.csv", sep = ",")
head(sqldf("select pwgtp1 from acs where AGEP < 50"))

################################################

a <- unique(acs$AGEP)
b <- sqldf("select distinct AGEP from acs")
all(a == b)

################################################

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
nchar(htmlCode[c(10, 20, 30, 100)])

################################################

fwfFile <- read.fwf("fwfile.for", skip = 4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(fwfFile$V4)