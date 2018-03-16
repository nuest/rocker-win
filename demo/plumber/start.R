library("plumber")

pr <- plumber::plumb("C:/R/library/plumber/examples/04-mean-sum/plumber.R")

#setwd("C:/R/library/plumber/examples/11-car-inventory/")
#pr <- plumber::plumb("C:/R/library/plumber/examples/11-car-inventory/plumber.R")

pr$run(host = '0.0.0.0', port = 8000)
