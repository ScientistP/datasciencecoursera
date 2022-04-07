#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
#The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
#Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified 
#in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA.

#visit: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md
#The overall objective of the assignment 2 is to demonstrate the concept of lexical scoping.

#https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-discussPollutantmean.md



pollutantmean <-function(directory, pollutant, id=1:332, removaNA=TRUE){
  directory <- "~/dev/datasciencecoursera/data/specdata/"
  
  id <- 
  for (i in id)
  df<- df[i,  read.csv("../data/specdata/001.csv")]
  
  
  
  nc <- ncol()
  id_start <- 
  pollutant 
  id
  for(i in 1:id){
    d
    mean(i)
  }
  
}