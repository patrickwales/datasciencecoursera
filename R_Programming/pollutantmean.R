
pollutantmean <- function(directory="/Users/patrickwales/datasciencecoursera/R_Programming/specdata/", pollutant, id = 1:332){
  ## Aggregate data from all the files
  data = getDataSet(directory, pollutant, id)
  
  ## Get a column 
  pollutantcol = na.omit(data)[,1]
  
  ## Get the mean
  return(mean(pollutantcol))
} 

getDataSet <- function(directory, pollutant, id){
  data = data.frame()
  for(i in id){
    path = getPath(directory, i)
    curdata = read.csv(path)
    data = rbind(data, data.frame(curdata[[pollutant]]))
  }
  return(data)
}

getPath <- function(directory, id){
  zeros = c("", "0", "00")
  id = as.character(id)
  correctid = paste(zeros[[4 - nchar(id)]], id, sep="")
  print(correctid)
  path = paste(directory, correctid, ".csv", sep="")
  return(path)
}