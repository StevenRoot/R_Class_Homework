test.hw1 <- function()
{
  expected_result <- "CYPRESS FAIRBANKS MEDICAL CENTER"
  checkEquals(expected_result, best("TX","heart attack"))
}

test.hw2 <- function()
{
  expected_result <- "FORT DUNCAN MEDICAL CENTER"
  checkEquals(expected_result, best("TX", "heart failure"))
}

test.hw5 <- function()
{
  #expected_result <- "Error in best(""BB", ""heart attack""") : invalid state"
  expected_result <- "invalid state"
  checkException(best("BB", "heart attack"), expected_result)
}

test.hw6 <- function()
{
  #expected_result <- "Error in best("NY", "hert attack") : invalid outcome"
  expected_result <- "invalid outcome"
  
  checkException(best("NY", "hert attack"), expected_result)
}



test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}

if (FALSE)
{  
  
  stop_test <- function(){stop("invalid state")} 
  dont_stop_test <- function(){"don't stop"}
  
  test.hw0 <- function()
  {
    expected_result <- "00Error in stop_test() : invalid state"
    checkException(stop_test(), expected_result)
  }
  
  test.hw01 <- function()
  {
    expected_result <- "00Error in stop_test() : invalid state"
    checkException(dont_stop_test(), expected_result)
  }
  test.hw3 <- function()
  {
    expected_result <- "JOHNS HOPKINS HOSPITAL, THE"
    checkEquals(expected_result, best("MD", "heart attack"))
  }
  
  test.hw4 <- function()
  {
    expected_result <- "GREATER BALTIMORE MEDICAL CENTER"
    checkEquals(expected_result, best("MD", "pneumonia"))
  }
  
  test.hw5 <- function()
  {
    #expected_result <- "Error in best(""BB", ""heart attack""") : invalid state"
    expected_result <- "invalid state"
    checkException(best("BB", "heart attack"), expected_result)
  }
  
  test.hw6 <- function()
  {
    #expected_result <- "Error in best("NY", "hert attack") : invalid outcome"
    expected_result <- "invalid outcome"
    
    checkException(best("NY", "hert attack"), expected_result)
  }

  test.hw7 <- function()
  {
    expected_result <- "DETAR HOSPITAL NAVARRO"
    checkEquals(expected_result, rankhospital("TX", "heart failure", 4))
  }
  
  test.hw8 <- function()
  {
    expected_result <- "HARFORD MEMORIAL HOSPITAL"
    checkEquals(expected_result, rankhospital("MD", "heart attack", "worst"))
  }

  test.hw9 <- function()
  {
    expected_result <- NA
    checkEquals(expected_result, rankhospital("MN", "heart attack", 5000))
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
