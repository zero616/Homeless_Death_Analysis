#### Preamble ####
# Purpose: Cleans the raw data 
# Author:Shipeng Zhang
# Date: 22 January 2024
# Contact: shipeng.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: running the 01-download_data.R

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

