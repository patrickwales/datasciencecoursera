complete <- function(directory, idnums = 1:332) {
  
  data = data.frame()
  zeros = c("", "0", "00")
  for(id in idnums){
    id = as.character(id)
    path = getPath(directory, id)
    
    ## Get the number of complete lines
    nobs = nrow(na.omit(read.csv(path)))
    row = data.frame(id, nobs)
    data = rbind(data, row)
  }
  return(data)
}

getPath <- function(directory, id){
  zeros = c("", "0", "00")
  id = as.character(id)
  correctid = paste(zeros[[4 - nchar(id)]], id, sep="")
  path = paste(directory, "/", correctid, ".csv", sep="")
  return(path)
}