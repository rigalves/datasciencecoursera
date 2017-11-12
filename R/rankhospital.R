rankhospital <- function(state, outcome, num = "best") {
    # Check that outcome is valid
    
    validOutcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    if (!any(names(validOutcomes) == tolower(outcome))) {
        stop("invalid outcome")
        return
    }
    
    ## Read outcome data
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    dataForState <- split(data, data$State)[[state]]
    
    ## Check that state is valid
    
    if(length(dataForState) == 0) {
        stop("invalid state")
        return
    }
    
    ## Converting outcome column to numbers
    
    suppressWarnings(dataForState[,validOutcomes[outcome]] <- as.numeric(dataForState[,validOutcomes[outcome]]))
    
    ## Check that num is valid
    if(tolower(num) == "best") {
        num = 1
    } else if(tolower(num) == "worst") {
        num = length(na.omit(dataForState[,validOutcomes[outcome]]))
    } else if(is.numeric(num)) {
        if(num > length(dataForState[,validOutcomes[outcome]])) {
            return(NA)
        }
    } else {
        stop("invalid rank")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    dataForStateNoNA <- na.omit(dataForState, cols = validOutcomes[outcome])
    rankedHospitals <- dataForStateNoNA[order(dataForStateNoNA[,validOutcomes[outcome]], dataForStateNoNA[,2]),c(2,validOutcomes[outcome])]
    rankedHospitals[, "Rank"] <- 1: length(rankedHospitals[,1])
    rankedHospitals[rankedHospitals[, "Rank"] == num, 1]
}