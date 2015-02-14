library('RUnit')

source('polluttantmean.R')

test.suite <- defineTestSuite("hw1",
                              dirs = file.path(getwd(), "tests"),
                              testFileRegexp = '^hw1_\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)