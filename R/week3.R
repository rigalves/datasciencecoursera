x <- list(a = 1:5, b = rnorm(10)); 
lapply(x, mean)

x <- 1:4
lapply(x, runif)
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1])

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100)) 
lapply(x, mean)
sapply(x, mean)

###########################

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, sum)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4: 1)

noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2)
list(noise(1, 1, 2), noise(2, 2, 2), noise(3, 3, 2), noise(4, 4, 2), noise(5, 5, 2))

###########################

x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)

###########################

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
lapply(split(x, f), mean)
tapply(x, f, mean)

s <- split(airquality, airquality$Month)
s
fnx <- function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])
fnx2 <- function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = T)
lapply(s, fnx)
sapply(s, fnx)
sapply(s, fnx2)

x <- rnorm(10)
x
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
split(x, list(f1, f2))
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = T))

###########################

printmessage <- function(x) {
    if(x > 0)
        print("1")
    else
        print("2")
    invisible(x)
}
x <- printmessage(3)
printmessage(NA)

printmessage2 <- function(x) {
    if(is.na(x))
        print("huh?")
    else if(x > 0)
        print("1")
    else
        print("2")
    invisible(x)
}
x <- log(-1)
printmessage2(x)

###########################

mean(b)
traceback()

lm(y ~ x)
traceback()

debug(lm)
lm(y ~ x)

options(error = recover)
read.csv("nosuchfile")