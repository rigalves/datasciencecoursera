###########################
x <- 4
if(x > 3) {
    y <- 10
} else {
    y <- 0
}
y
y <- if(x > 3) {
    10
} else {
    0
}
y

###########################

for(i in 1:10)
    print(i)

x <- c("a", "b", "c", "d")
for(i in 1:4) {
    print(x[i])
}
for(i in seq_along(x))
    print(x[i])
for(letter in x)
    print(letter)
for(i in 1:4) print(x[i])
seq_along(x)

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}

###########################

count <- 0
while(count < 10) {
    print(count)
    count <- count + 1
}

###########################

count <- 0
repeat {
    if(count == 3)
        break
    print(count)
    count <- count + 1
}

###########################

add2 <- function(x, y) {
    x + y
}
add2(3, 4)

above10 <- function(x) {
    use <- x > 10
    x[use]
}
above10(1:20)

above <- function(x, n = 10) {
    use <- x > n
    x[use]
}
above(1:20)

columnnean <- function(y, removeNA = TRUE) { 
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}
columnnean(airquality)

###########################

mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = F)
sd(na.rm = F, x = mydata)
sd(na.rm = F, mydata)

###########################

f <- function(a,b) {
    a^2
}
f(2)

f <- function(a,b) {
    print(a)
    print(b)
}
f(2)

args(paste)
args(cat)

args("a", "b", sep = ":")
args("a", "b", se = ":") #partial matching

###########################

lm <- function(x) {x * x}
lm

search()

###########################

make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))

y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) {
    x * y
}
f(3)

g <- function(x) {
    a <- 3
    x+a+y
}
g(2)
y <- 3
g(2)

###########################

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

x <- Sys.time()
x
class(x)
x$sec
p <- as.POSIXlt(x)
p
class(p)
unclass(p)
names(unclass(p))
p$sec

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

x <- as.Date("2012-03-01") ; y <- as.Date("2012-02-28")
x-y
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
x-y