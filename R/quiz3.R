library(datasets)
data(iris)
s <- split(iris, iris$Species);s
round(sapply(s, function(x) mean(x[, "Sepal.Length"]))["virginica"])

#################################

head(iris)
apply(iris, 1, mean)
rowMeans(iris[, 1:4])
apply(iris[, 1:4], 1, mean)
colMeans(iris)
apply(iris, 2, mean)
apply(iris[, 1:4], 2, mean)

#################################

library(datasets)
data(mtcars)

apply(mtcars, 2, mean) #NO
tapply(mtcars$mpg, mtcars$cyl, mean) #YES
mean(mtcars$mpg, mtcars$cyl) #NO
sapply(mtcars, cyl, mean) #NO
lapply(mtcars, mean) #NO
with(mtcars, tapply(mpg, cyl, mean)) #YES
tapply(mtcars$cyl, mtcars$mpg, mean) #NO
sapply(split(mtcars$mpg, mtcars$cyl), mean) #YES
split(mtcars, mtcars$cyl) #NO

x <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(x[3] - x[1]))

#################################

debug(ls)
ls()