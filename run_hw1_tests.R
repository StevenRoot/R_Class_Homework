library('RUnit')

source('pollutantmean.R')
source('complete.R')
source('corr.R')

test.suite <- defineTestSuite("hw1",
                              dirs = file.path(getwd(), "tests"),
                              testFileRegexp = '^hw1_\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)