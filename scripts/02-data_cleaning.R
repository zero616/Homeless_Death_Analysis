#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")
raw_data <- dplyr::select(raw_data, -X_id)   
# Remove rows where 'Gender' is 'Unknown'
#raw_data <- raw_data %>% filter(Gender != 'Unknown')
#raw_data <- raw_data %>% filter(Age_group != 'Unknown')
# Remove rows where 'Cause_of_death' is 'Unknown/Pending'
cleaned_data <- raw_data %>%
  filter(Cause_of_death != 'Unknown/Pending')

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

