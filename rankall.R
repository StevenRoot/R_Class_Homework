rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Read outcome data
  outcome_data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv")
  outcome_prefix <- "Hospital.30.Day.Death..Mortality..Rates.from."
  
  ## Check that state and outcome are valid
  outcome_words <- strsplit(outcome," ")[[1]]
  outcome_append_text <- paste(toupper(substring(outcome_words,1,1)), substring(outcome_words,2), sep = "", collapse = ".")
  final_outcome <- paste(outcome_prefix, outcome_append_text, sep="")
  
  outcome_valid <- final_outcome %in% colnames(outcome_data)
  num_valid = FALSE
  if ((num == "best") || (num == "worst") || (is.numeric(num)))
  {
    num_valid = TRUE
  }
  
  # valid if state is int he state column and malady s in the column names....
  if ((outcome_valid == TRUE) & (num_valid == TRUE))
  {
    # remove all of the bad rows from the entire set....
    outcome_only <- outcome_data[final_outcome]
    outcome_only <- complete.cases(as.numeric(as.character(outcome_only[,1])))
    outcome_subset <- outcome_data[outcome_only,]
    
    # this function will take a state as input...  and output a pair in the form of mortality 
    ranked_hospital_in_state <- function(state, outcome, num, final_outcome)
    {
      state_outcome_subset <- subset(outcome_subset, State==state)
      
      s_outcome_subset <- state_outcome_subset[order(as.numeric(as.character(state_outcome_subset[,final_outcome])), state_outcome_subset[,"Hospital.Name"]),]    
      
      # now determing the #
      if (num == "best")
      {
        index = 1
      }
      else if (num == "worst")
      {
        index = nrow(s_outcome_subset)
      }
      else
      {
        index = num
      }
      
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      if (index > nrow(s_outcome_subset))
      {
        hospital <- "NA"  
      }
      else
      {
        hospital <- as.character(s_outcome_subset[index, "Hospital.Name"])  
      }
      return (c (hospital = hospital, state = state))
    }
    
    # split by state and calculate the results?
    ## For each state, find the hospital of the given rank
    state_list <- levels(outcome_data$State)
    
    result_list <- lapply(state_list, ranked_hospital_in_state, outcome, num, final_outcome)
    ## Return a data frame with the hospital names and the
    # convert result into a data frame

    ## (abbreviated) state name
    result_dataf <- data.frame(matrix(unlist(result_list), nrow=54, byrow=T), row.names = state_list)
    colnames(result_dataf) <- c("hospital", "state")
    return (result_dataf)
  }
}