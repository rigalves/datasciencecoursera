source("complete.R")
corr <- function(directory, threshold = 0) {
    allCompleteCases <- complete(directory)
    filteredCases <- allCompleteCases[allCompleteCases$nobs >= threshold, ]
    result = vector(mode="numeric", length=0)
    
    for(caseId in filteredCases$id) {
        csvPath <- paste(directory, "/", sprintf("%03d", caseId), ".csv", sep = "")
        csv <- read.csv(file = csvPath)
        # print(paste(length(csv$sulfate), length(csv$nitrate)))
        # print(length(csv$sulfate) == length(csv$nitrate))
        corResult <- cor(csv$sulfate, csv$nitrate,use='p')
        result = c(result, corResult)
    }
    
    result
}
# cr <- corr("specdata", 150)
# head(cr)
# ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
# summary(cr)
# ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
# cr <- corr("specdata", 400)
# head(cr)
# ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
# summary(cr)
# ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313
# cr <- corr("specdata", 5000)
# summary(cr)
# ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# ## 
# length(cr)
# ## [1] 0
# cr <- corr("specdata")
# summary(cr)
# ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# ## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
# length(cr)
# ## [1] 323