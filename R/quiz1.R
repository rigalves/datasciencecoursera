#############
x <- 4
class(x)
#############
x <- c(4, TRUE)
class(x)
#############
x <- c(1,3, 5) 
y <- c(3, 2, 10)
cbind(x, y)
#############
x <- list(2, "a", "b", TRUE)
x[[2]] 
#############
x <- 1:4
y <- 2:3
z = x+y; z
class(z)
############# 0 - 0 - 0 - 10 - 12 - 6
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] == 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x > 0] <- 6;x
x <- c(3, 5, 1, 10, 12, 6)
x[x == 0] <- 6;x
x <- c(3, 5, 1, 10, 12, 6)
x[x == 0] < 6;x
x <- c(3, 5, 1, 10, 12, 6)
x[x != 6] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x == 6] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x >= 6] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0;x
x <- c(3, 5, 1, 10, 12, 6)
x[x > 6] <- 0;x
############# 
x <- read.csv("hw1_data.csv")
head(x,2)
############# 
x <- read.csv("hw1_data.csv")
nrow(x)
############# 
x <- read.csv("hw1_data.csv")
tail(x,2)
############# 
x <- read.csv("hw1_data.csv")
x$Ozone[47]
############# 
x <- read.csv("hw1_data.csv")
yy <- x$Ozone
omv <- yy[is.na(yy)]
length(omv)
############# 
x <- read.csv("hw1_data.csv")
yy <- x$Ozone
ov <- yy[!is.na(yy)]
mean(ov)
############# 
x <- read.csv("hw1_data.csv")
y <- x[x$Ozone > 31,]
z <- y[y$Temp > 90, ]
a <- z$Solar.R
b <- is.na(a)
c <- a[!b];c
mean(c)
############# 
x <- read.csv("hw1_data.csv")
y <- x[x$Month == 6,]
mean(y$Temp)
############# 
x <- read.csv("hw1_data.csv")
y <- x[x$Month == 5,]
bb <- y$Ozone; 
z <- is.na(y$Ozone)
a <- bb[!z]; 
max(a)
