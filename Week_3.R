# construct the data set
set.seed(13435)
x = data.frame("var1"=sample(1:5)
               , "var2"=sample(6:10)
               , "var3"=sample(11:15))
x = x[sample(1:5), ]
x$var2[c(1, 3)] = NA

# subsetting
x[, 1]
x[, "var1"]
x[1:2, "var2"]
x[(x$var1 <= 3) & (x$var3 > 11), ]
x[which(x$var2 > 8), ]  # ignore NA

# sorting
sort(x$var2, decreasing = TRUE, na.last = TRUE)
x[order(x$var1), ]  # sort by column
x[order(x$var1, x$var2), ]
library(plyr)
arrange(x, desc(var1))  # better

# adding data
x$var4 = rnorm(5)
cbind(x, rnorm(5))  # similar with rbind()

# summarizing
head()
tail()
summary()  # should enter a legit data variable
str()
# quantile( , na.rm=TRUE, probs=c(0.3, 0.6, 0.8))
# table() can apply to one or two columns
table(useNA = "ifany")  #  value count function
sum(is.na())  # count NA
any(is.na())  # FALSE if all are not NA
all()  # enter a legit condition
colSums(is.na())

# example
data("UCBAdmissions")
df = as.data.frame(UCBAdmissions)
st = xtabs(df$Freq ~ df$Gender + df$Admit)  # cross tabs
st = xtabs(Freq ~ ., data = df)
st[, , "C"]

# creating variables
seq(1, 10, by = 2)
seq(1, 10, length = 3)
seq(along = c(1, 3, 8, 25, 100))
df$new1 = ifelse(df$Freq < 250, 1, 0)
table(df$Freq < 250, df$new1)
df$group = cut(df$Freq, breaks = quantile(df$Freq))
table(df$group)  # note the min get <NA>
df$f = factor(df$Dept)

# reshaping data
data("mtcars")
mtcars$carname = rownames(mtcars)
carMelt = melt(as.data.table(mtcars), id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt)  # get a very long panel
dcast(carMelt, cyl ~ variable, mean)  # default is length()

# merging data
merge(df1, df2, by.x="var1", by.y="var2", all=TRUE)

# quiz
df1 = read.csv("getdata_data_GDP.csv")
df2 = read.csv("getdata_data_EDSTATS_Country.csv")
df1 = df1[-c(1, 2, 3, 4), c(1, 4, 5)]
intersect(df1$X, df2$CountryCode)[13]
df = merge(df1, df2, by.x = "X", by.y = "CountryCode")
df$X.3 = as.numeric(df$X.3)
df$rank = order(df$X.3, decreasing = TRUE)
tapply(df$rank, df$Income.Group, mean)
