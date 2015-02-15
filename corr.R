corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  return_vector<-numeric()
  
  if (file.exists(directory))
  {
    # create a complete list of all of the files....
    complete_list<-complete(directory)
    
    # now shorten the list to only those with entries greater than the threshold
    remaining_list<-complete_list[complete_list[,"nobs"]>threshold,, drop = FALSE]
    if ( nrow(remaining_list) > 0)
    {
      for (i in 1:nrow(remaining_list))
      {
        fname<-file.path(directory,sprintf("%03d.csv",remaining_list[i,"id"]))
        if (file.exists(fname))
        {
          dataframe<-read.csv(fname)
          #dataframe_complete<-dataframe[complete.cases(dataframe),]
          dataframe_complete<-dataframe
          cor_data<-cor(dataframe_complete$nitrate, dataframe_complete$sulfate, use="complete.obs")
          #file_result<-c(remaining_list[i,"id"], cor_data)
          return_vector<-c(return_vector,cor_data)
        }
      }
    }
  }
  #as.numeric(return_matrix)
  return_vector
}

