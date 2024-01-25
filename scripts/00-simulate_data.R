#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library("tidyverse")
# [...UPDATE THIS...]

#### Simulate simulated_data ####
# [...ADD CODE HERE...]
#### Simulate ####
set.seed(853)

# Number of rows in the table
num_rows <- 100

# Create a vector of years from 2017 to 2023
years <- rep(seq(2017, 2023), each = num_rows )

# Simulate simulated_data for the table
simulated_data <- data.frame(
  Year.of.death = rep(years, each = num_rows ),
  Cause_of_death = sample(c("Accident", "Cancer", "Cardiovascular Disease", "Drug Toxicity", "Homicide", "Other", "Pneumonia", "Suicide"), num_rows, replace = TRUE),
  Age_group = sample(c("40-59", "60+", "Unknown", "20-39", "<20"), num_rows, replace = TRUE),
  Gender = sample(c("Male", "Female"), num_rows, replace = TRUE),
  Count = sample(1:10, num_rows, replace = TRUE)
)

# Add COVID-19 as a cause of death from 2020 onwards
simulated_data$Cause_of_death[simulated_data$Year.of.death >= 2020] <- sample(c("Accident", "Cancer", "Cardiovascular Disease", "Drug Toxicity", "Homicide", "Other", "Pneumonia", "Suicide", "Unknown/Pending", "COVID-19"), sum(simulated_data$Year.of.death >= 2020), replace = TRUE)

# Print the first few rows of the simulated simulated_data
head(simulated_data)



