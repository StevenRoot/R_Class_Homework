best <- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv")
  outcome_prefix <- "Hospital.30.Day.Death..Mortality..Rates.from."
  
  ## Check that state and outcome are valid
  outcome_words <- strsplit(outcome," ")[[1]]
  outcome_append_text <- paste(toupper(substring(outcome_words,1,1)), substring(outcome_words,2), sep = "", collapse = ".")
  final_outcome <- paste(outcome_prefix, outcome_append_text, sep="")
  
  outcome_valid <- final_outcome %in% colnames(outcome_data)
  state_valid <- state %in% outcome_data[, 7]
  
  # valid if state is int he state column and malady s in the column names....
  if ((outcome_valid == TRUE) & (state_valid == TRUE))
  {
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
  }
  else if (!outcome_valid)
  {
    stop("invalid outcome")
  }
  else # (!state_valid)
  {
    stop("invalid state")
  } 
}

#"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
#"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
#"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 