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

if (FALSE)
{  
  
  
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