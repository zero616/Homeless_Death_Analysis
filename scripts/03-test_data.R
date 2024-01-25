#### Preamble ####
# Purpose: Tests of simulated_data
# Author:Shipeng Zhang
# Date: 22 January 2024
# Contact: shipeng.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: running 00-simulate_data.R


#### Workspace setup ####
library(tidyverse)
#### Test data ####
if (!exists("simulated_data")) {
  stop("Error: 'simulated_data' does not exist.")
}

# Test: Check if simulated_data is a data frame
if (!is.data.frame(simulated_data)) {
  stop("Error: 'simulated_data' is not a data frame.")
}

# Test: Check if necessary columns exist
required_columns <- c("Year.of.death", "Cause_of_death", "Age_group", "Gender", "Count")
if (!all(required_columns %in% colnames(simulated_data))) {
  stop("Error: Missing one or more required columns in 'simulated_data'.")
}

# Test: Check if the number of rows is as expected
expected_rows <- 100 * length(unique(simulated_data$Year.of.death))
rows = nrow(simulated_data)
if ( rows != expected_rows) {
  stop("Error: Unexpected number of rows in 'simulated_data'.")
}

# Test: Check if causes of death are as expected
expected_causes <- c("Accident", "Cancer", "Cardiovascular Disease", "Drug Toxicity", "Homicide", "Other", "Pneumonia", "Suicide", "Unknown/Pending", "COVID-19")
actual_causes <- unique(simulated_data$Cause_of_death)
if (!all(sort(actual_causes) == sort(expected_causes))) {
  stop("Error: Unexpected causes of death in 'simulated_data'.")
}

# If all tests pass, print a success message
cat("All tests passed successfully.\n")

