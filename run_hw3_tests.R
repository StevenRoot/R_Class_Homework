library('RUnit')

source('best.R')
source('rankhospital.R')
source('rankall.R')

test.suite <- defineTestSuite("hw3",
                              dirs = file.path(getwd(), "tests"),
                              testFileRegexp = '^hw3_\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)