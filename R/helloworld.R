myfunction <- function() {
	x <- rnorm(100)
	mean(x)
}

secondFn <- function(x) {
	x + rnorm(length(x))
}