if (! file.exists("./data")) {
  dir.create("./data")  # create data directory
}
setwd("./data")  # set directory to store data
setwd("../")  # return to project directory
url = "URL"  # not a real thing
download.file(url, destfile = "./data/demo.csv")
list.files("./data")  # should work for valid url


