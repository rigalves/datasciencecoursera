################## 

x <- 1
print(x)
x
msg <- "hello"

##################


y <- 1L
y <- 2.4
y
attributes(y)

###################

x <- c(0.5, 0.6, 0.8)
x
x <- 1:19
x
x <- c(T,F)
x
x <- vector("numeric", length = 10)
x

y <- c(1.7,"a") # COERCION
y 
y <- c(T,2)
y
y <- c("a", TRUE)
y

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a","b","c")
as.numeric(x)
as.logical(x)

x <- list(1, "a", T, 1 + 4i)
x

###################

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes

m <- matrix(1: 6, nrow = 2, ncol = 3)
m

m <- 1:10
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

###################

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"), labels = c("yes","no"))
x

###################

x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x <- c(1,2,NaN, NA, 4)
is.na(x)
is.nan(x)

###################

x <- data.frame(foo = 1:4,bar = c(T,T,F,F))
x
nrow(x)
ncol(x)

###################

x <- 1:3
x
names(x)
names(x) <- c("foo","bar","norf")
x
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m

###################

y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y = dget("y.R")
new.y

x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x, y)
x
y
source("data.R")
y
x

###################

str(file)

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
close(con)

###################

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]

###################

x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]

###################

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]
x$name
x$foo

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2,1)]]

###################

x <- matrix(1:6, nrow = 2, ncol = 3)
x[,]
x[1, 2]
x[2, 1]
x[1, ]
x[, 2]

x <- matrix(1:6, nrow = 2, ncol = 3)
x[1, 2]
x[1, 2, drop = FALSE]

x <- matrix(1:6, nrow = 2, ncol = 3)
x[1, ]
x[1, , drop = F]

###################

x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = F]]

###################

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
bad
x[!bad]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

###################

x <- 1:4; y <- 6:9
x + y
x < 2
x <= 2
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
y
x * y
x / y
x %*% y