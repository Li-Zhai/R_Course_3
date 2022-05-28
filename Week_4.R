# play with strings
before = c("first.Thing", "second.Thing", "the.last.Thing")
after = strsplit(txt, "\\.")
after[[2]][1]
sapply(after, function(x){x[1]})
tolower(sub("\\.", "", before))  # only replace the first
gsub("\\.", "", before)  # replace all
x = as.factor(sample(c("Bad", "Good"), 100, replace = TRUE))
table(grepl("oo", x))  # return whether contain "oo"
grep("Ba", x)  # return the index of those contain "Ba"
grep("Ba", x, value = TRUE)  # return the actual string

x = "AFreakingLongString"
substr(x, 3, 7)
nchar(x)  # get length of the string
paste("First", "Second", sep = "|")
paste0("First", "Second")  # with no separator
strtrim("Bad String              ", 10)
