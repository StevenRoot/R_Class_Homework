pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  
  # test to see if directory exists...
  if (file.exists(directory))
  {
    result_vec<-NULL
    for (i in seq (along=id))
    {
      fname<-file.path(directory,sprintf("%03d.csv",id[i]))
      if (file.exists(fname))
      {
        dataframe<-read.csv(fname)
        # confirm the field
        if(pollutant %in% colnames(dataframe))
        {
          result_vec<-c(result_vec, dataframe[,pollutant])
        }
      }
    }
    mean(result_vec, na.rm=TRUE)
  }
  else 
  {
    NULL
  }
  # if it exists  then go through and 1 by 1 pull the data for each
  # file and add that to a summary vector
  # finally take mean of summary vector and return  
}