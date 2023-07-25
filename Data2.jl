using Random
Random.seed!(100)
NFiles = 10000
MaxFilesSize = 10000
MaxRetrivelTimes = 10000
FilesSize = rand(1:MaxFilesSize, NFiles)/1000
RetriveTimes = rand(1:(MaxRetrivelTimes), NFiles)/1000

RetrivelRate = 0.1
MinStorage = 45
