# MySQL
library(DBI)
library(RMySQL)
db = dbConnect(MySQL(), user="root", host="127.0.0.1"
               , password="x60yj/3eric", db="sakila")
dbListFields(db, "language")
# access the table through SQL command
command = "SELECT * FROM language ORDER BY `last_update` desc;"
dbGetQuery(db, command)
dbReadTable(db, "language")  # direct access
dbDisconnect(db)  # should disconnect

# HDF5
library(rhdf5)
created = h5createFile("example.h5")
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")
A = matrix(1:10, 5, 2)
h5write(A, "example.h5", "foo/A")
h5write(c(12, 13, 14), "example.h5", "foo/A", index=list(1:3, 1))
B = array(seq(0.1, 2.0, by=0.1), dim = c(5, 2, 2))
attr(B, "scale") = "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")
h5read("example.h5", "foo/A")

# something about httr package to access web

# something about httr package to access API
