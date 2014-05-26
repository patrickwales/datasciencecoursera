corr <- function(directory, threshold = 0){
  ## Get the complete ids
  completeness = complete("specdata")
  completeids = completeness[which(completeness[,2] > threshold),1]
  
  ## If no complete cases above threshold
  if(length(completeids) == 0){
    return(completeids)
  }
  
  ## For all the complete cases
  allcors = vector()
  for(i in completeids){
      path = getPath(directory, i)
      data = na.omit(read.csv(path))
      curcor = cor(data[,2], data[,3])
      allcors = c(allcors, curcor)
  }
  return(allcors)
}


getPath <- function(directory, id){
  zeros = c("", "0", "00")
  id = as.character(id)
  correctid = paste(zeros[[4 - nchar(id)]], id, sep="")
  print(correctid)
  path = paste(directory, "/", correctid, ".csv", sep="")
  return(path)
}