x = list(a = 1:5, b = rnorm(10))
lapply(x, mean)  # always returns a list
# generate 1/2/3/4 uniform(0, 10)
lapply(1:4, runif, min = 0, max = 10)
# lapply also works with anonymous function

sapply(x, mean)  # can return a vector

x = matrix(rnorm(200), 20, 10)
apply(x, 2, mean)  # should specify dim
apply(x, 1, sum)
a = array(rnorm(2*2*100), c(2, 2, 10))
apply(a, c(1, 2), mean)

# list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)

x = c(rnorm(10), runif(10), rnorm(10, 1))
f = gl(3, 10)
# apply mean to x based on subsets specified by f
tapply(x, f, mean)

x = c(rnorm(10), runif(10), rnorm(10, 1))
f = gl(3, 10)
# split x based on subsets specified by f
split(x, f)  # always returns a list
lapply(split(x, f), mean)
a = split(airquality, airquality$Month)
lapply(a, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(a, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))

x = rnorm(10)
f1 = gl(2, 5)
f2 = gl(5, 2)
f = interaction(f1, f2)
split(x, list(f1, f2), drop = TRUE)  # using f does the same
