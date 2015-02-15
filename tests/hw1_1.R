test.hw1 <- function()
{
  checkEquals(4.064, round(pollutantmean(file.path(getwd(),"specdata"), "sulfate", 1:10),3))
}

test.hw2 <- function()
{
    checkEquals(1.706, round(pollutantmean(file.path(getwd(),"specdata"), "nitrate", 70:72),3))
}

test.hw3<- function()
{
  checkEquals(1.281, round(pollutantmean(file.path(getwd(),"specdata"), "nitrate", 23),3))
}

test.hw4<- function()
{
  expected_result<-matrix(c(1,117),nrow = 1, ncol=2, dimnames=list(c(),c("id","nobs")))
  
  checkEquals(expected_result, complete("specdata", 1))
}



test.hw5<- function()
{
  expected_result<-matrix(c(2, 4, 8, 10, 12, 1041, 474, 192, 148, 96),nrow = 5, ncol=2, dimnames=list(c(),c("id","nobs")))
  
  checkEquals(expected_result, complete(file.path(getwd(),"specdata"), c(2, 4, 8, 10, 12)))
}  

test.hw6<- function()
{
  expected_result<-matrix(c(30, 29, 28, 27, 26, 25, 932, 711, 475, 338, 586, 463), nrow = 6, ncol=2, dimnames=list(c(),c("id","nobs")))
  
  checkEquals(expected_result, complete(file.path(getwd(),"specdata"), 30:25))
} 

test.hw7<- function()
{
  expected_result<-matrix(c(3, 243), nrow = 1, ncol=2, dimnames=list(c(),c("id","nobs")))
  
  checkEquals(expected_result, complete(file.path(getwd(),"specdata"), 3))
}  

test.hw8<- function()
{
  expected_result<-c(-0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589)
  
  cr <- corr("specdata", 150)
  actual_result<-head(cr)
  
  checkEquals(expected_result, actual_result)
  
  expected_summary_result <- matrix(c(-0.2110, -0.0500, 0.0946,0.1250, 0.2680, 0.7630),nrow = 1, ncol = 6, dimnames=list(c(), c("Min.","1st Qu.", "Median", "Mean", "3rd Qu.", "Max."))) 
  summary_result<-summary(cr)
  checkEquals(expected_summary_result, summary_result)
}

if (FALSE)
{  

test.hw9<- function()
{
  expected_result<-c(-0.01896, -0.04390, -0.06816, -0.07589, 0.76313, -0.15783)
  cr <- corr("specdata", 400)
  actual_result<-head(cr)
  checkEquals(expected_result, actual_result)

  expected_summary_result <- matrix(c(-0.1760, -0.0311, 0.1000, 0.1400, 0.2680, 0.7630), nrow = 1, ncol = 6, dimnames=list(c(), c("Min.","1st Qu.", "Median", "Mean", "3rd Qu.", "Max."))) 
  summary_result<-summary(cr)
  checkEquals(expected_summary_result, summary_result)
}

test.hw10<- function()
{
  cr <- corr("specdata", 5000)
  expected_summary_result <- matrix(c(), nrow = 0, ncol = 6, dimnames=list(c(), c("Min.","1st Qu.", "Median", "Mean", "3rd Qu.", "Max."))) 
  summary_result<-summary(cr)
  checkEquals(expected_summary_result, summary_result)
  
  checkEquals(0, length(cr))
}

test.hw11<- function()
{
  cr <- corr("specdata")
  expected_summary_result <- matrix(c(-1.0000, -0.0528, 0.1070, 0.1370, 0.2780, 1.0000), nrow = 1, ncol = 6, dimnames=list(c(), c("Min.","1st Qu.", "Median", "Mean", "3rd Qu.", "Max."))) 
  summary_result<-summary(cr)
  checkEquals(expected_summary_result, summary_result)
  
  checkEquals(323, length(cr))
}

test.hw4<- function()
{
  # checkEquals(6, factorial(3))
  # checkEqualsNumeric(6, factorial(3))
  # 
  # checkIdentical(6, factorial(3))
  # checkTrue(2 + 2 == 4, 'Arithmetic works')
  # checkException(log('a'), 'Unable to take the log() of a string')
}
}

test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}