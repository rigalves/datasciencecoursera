# Function that finds the best hospital in a state

best <- function(state, outcome) {
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    suppressWarnings(dataForState[,validOutcomes[outcome]] <- as.numeric(dataForState[,validOutcomes[outcome]]))
    bestValue <- min(dataForState[,validOutcomes[outcome]], na.rm = T)
    a <- invisible(na.omit(dataForState[dataForState[,validOutcomes[outcome]] == bestValue, 2]))
    sort(a)[1]
}