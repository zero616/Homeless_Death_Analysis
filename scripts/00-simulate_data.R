#### Preamble ####
# Purpose: Simulates of Death of Homeless Data
# Author:Shipeng Zhang
# Date: 22 January 2024
# Contact: shipeng.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library("tidyverse")

#### Simulate simulated_data ####
set.seed(853)

# Number of rows in the table
num_rows <- 100

# Create a vector of years from 2017 to 2023
years <- rep(seq(2017, 2023) )

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



