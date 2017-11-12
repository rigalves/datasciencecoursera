pollutantmean <- function(directory, pollutant, id = 1:332) {
    allValues <- NULL
    for(fileId in id) {
        csvPath <- paste(directory, "/", sprintf("%03d", fileId), ".csv", sep = "")
        csv <- read.csv(file = csvPath)
        colValues <- csv[pollutant]
        naTest <- is.na(colValues)
        validValues <- colValues[!naTest]
        allValues <- c(allValues, validValues)
    }
    mean(allValues)
}
# pollutantmean("specdata", "sulfate", 1:10)
# ## [1] 4.064128
# pollutantmean("specdata", "nitrate", 70:72)
# ## [1] 1.706047
# pollutantmean("specdata", "nitrate", 23)
# ## [1] 1.280833