## Ranking hospitals in all states

rankall <- function(outcome, num = "best") {
    # Check that outcome is valid
    
    validOutcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    if (!any(names(validOutcomes) == tolower(outcome))) {
        stop("invalid outcome")
    }
    
    ## Read outcome data
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## For each state, find the hospital of the given rank
    
    dataByState = split(data, data$State)
    result <- data.frame(hospital = character(), state = character(), stringsAsFactors = F)
    for(stateData in dataByState) {
        currentState <- stateData[1, "State"]
        
        ## Check that num is valid
        
        if(is.numeric(num) && num > length(stateData[,1])) {
            result[nrow(result) + 1,] <- c("<NA>", currentState)
        } else {
            ## Converting outcome column to numbers
            
            suppressWarnings(stateData[,validOutcomes[outcome]] <- as.numeric(stateData[,validOutcomes[outcome]]))
            
            ## Calculate the rank for the current state
            
            tnum <- num
            stateDataNoNA <- na.omit(stateData, cols = validOutcomes[outcome])
            if(tolower(tnum) == "best") {
                tnum = 1
            } else if(tolower(tnum) == "worst") {
                tnum = length(stateDataNoNA[,validOutcomes[outcome]])
            }
            rankedHospitals <- stateDataNoNA[order(stateDataNoNA[,validOutcomes[outcome]], stateDataNoNA[,2]),c(2,validOutcomes[outcome])]
            rankedHospitals[, "Rank"] <- 1: length(rankedHospitals[,1])
            result[nrow(result) + 1,] <- c(rankedHospitals[rankedHospitals[, "Rank"] == tnum, 1], currentState)
        }
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    result
}