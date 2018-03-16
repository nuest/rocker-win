library("plumber")

pr <- plumber::plumb("C:/demo/api.R")
pr$run(host = '0.0.0.0', port = 8000)
