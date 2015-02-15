complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  return_matrix<-matrix(nrow = 0, ncol=2, dimnames=list(c(),c("id","nobs")))
  
  if (file.exists(directory))
  {    
    for (i in seq (along=id))
    {
      fname<-file.path(directory,sprintf("%03d.csv",id[i]))
      if (file.exists(fname))
      {
        dataframe<-read.csv(fname)
        file_result<-matrix(c(id[i],sum(complete.cases(dataframe))), nrow=1,ncol=2)
        return_matrix<-rbind(return_matrix,file_result)    
      }
    }
  }
  as.data.frame(return_matrix)
}