if (! file.exists("./data")) {
  dir.create("./data")  # create data directory
}
setwd("./data")  # set directory to store data
setwd("../")  # return to project directory
url = "URL"  # not a real thing
download.file(url, destfile = "./data/demo.csv")
list.files("./data")  # should work for valid url

# XML files
library(XML)
# use htmlTreeParse similarly for HTML files
doc = xmlTreeParse("test.xml", useInternalNodes = TRUE)
rootNode = xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]  # the first <row> in <response>
# get value of certain <tag> using Xpath
xpathSApply(rootNode[[1]], "//zipcode", xmlValue)  

url = "http://biostat.jhsph.edu/~jleek/contact.html"
doc = url(url)
c = readLines(doc)

# JSON
library(jsonlite)
jsonData = fromJSON("url")  # should enter a legit url
# return type is a dataframe and can be subset using $
myjson = toJSON(iris, pretty = TRUE)
iris2 = fromJSON(myjson)  # return back to dataframe

# data.table
library(data.table)
df = data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), 3), z=rnorm(9))
head(df, 3)
dt = data.table(x=rnorm(9), y=rep(c("a", "b", "c"), 3), z=rnorm(9))
head(dt, 3)
tables()  # see all the data.table
dt[, 2]
df[df$y == "a",]
dt[c(2, 3)]  # using vector to subset rows
# cannot use vector to subset columns
dt[, list(mean(x), sum(z))]
dt[, table(y)]
dt[, w := z^2]  # quick way to add a new column
# WARNING: data.table is mutable
dt[, m := {log2(x+z+5)}]
dt[, a := x>0]
dt[, b := mean(x+w), by=a]
dt[, .N, by=a]  # use .N to implement .groupby().count()
setkey(dt, y)
dt["b"]  # can subset using key set
dt1 = data.table(x=c("a", "a", "b", "dt1"), y=1:4)
dt2 = data.table(x=c("a", "b", "dt2"), z=5:7)
setkey(dt1, x); setkey(dt2, x)
merge(dt1, dt2)  # merge to get a long panel data
# fread() is faster than read.table()
