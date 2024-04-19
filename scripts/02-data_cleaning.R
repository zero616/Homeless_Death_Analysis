#### Preamble ####
# Purpose: Cleans the raw data 
# Author:Shipeng Zhang
# Date: 18 April 2024
# Contact: shipeng.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(zoo)
library(tidyverse)
library(dplyr)
#### Clean data ####
raw_data_cost <- read_csv("inputs/data/raw_data_cost.csv")
raw_data_NHPI <- read_csv("inputs/data/raw_data_NHPI.csv")
raw_data_NHSR <- read_csv("inputs/data/raw_data_NHSR.csv")


cleaned_data_cost <- raw_data_cost %>%
  filter(Prices == "2017 constant prices")
##########################################
special_values <- unique(cleaned_data_cost$Estimates)
print(special_values)
####################################
test_data_cost <- cleaned_data_cost %>%
  filter(REF_DATE >="2009-10-01" & REF_DATE <="2019-03-01")
test_data_cost <- test_data_cost %>%
  filter(`Seasonal adjustment` == "Seasonally adjusted at quarterly rates")
test_data_cost <- test_data_cost %>%
  filter(Estimates == "Household final consumption expenditure")
test_data_cost <- test_data_cost %>%
  select(-c(DGUID, UOM, UOM_ID, SCALAR_FACTOR, SCALAR_ID, VECTOR, COORDINATE,TERMINATED,STATUS,SYMBOL,DECIMALS))
write_csv(test_data_cost, "outputs/data/cleaned_data_cost.csv")
test_data_cost <- test_data_cost %>%
  select(-c(GEO,Prices,`Seasonal adjustment`,Estimates))
test_data_cost <- test_data_cost %>%
  mutate(percent_change = round(((VALUE / 263430 - 1) * 100),2))
###################################
# Filter the data from 1999/01/01 to 2009/01/01
cleaned_data_cost <- cleaned_data_cost %>%
  filter(REF_DATE >="1999-10-01" & REF_DATE <="2009-10-01")
cleaned_data_cost <- cleaned_data_cost %>%
  filter(`Seasonal adjustment` == "Seasonally adjusted at quarterly rates")
cleaned_data_cost <- cleaned_data_cost %>%
  filter(Estimates == "Household final consumption expenditure")
cleaned_data_cost <- cleaned_data_cost %>%
  select(-c(GEO,DGUID, UOM, UOM_ID, SCALAR_FACTOR, SCALAR_ID, VECTOR, COORDINATE,TERMINATED,STATUS,SYMBOL,DECIMALS))
write_csv(cleaned_data_cost, "outputs/data/cleaned_data_cost.csv")
cleaned_data_cost <- cleaned_data_cost %>%
  select(-c(Prices,`Seasonal adjustment`,Estimates))
cleaned_data_cost <- cleaned_data_cost %>%
  mutate(percent_change = round(((VALUE / VALUE[1] - 1) * 100),2))
###################################

cleaned_data_NHPI <- raw_data_NHPI %>%
  select(-c( DGUID, UOM, UOM_ID, SCALAR_FACTOR, SCALAR_ID, VECTOR, COORDINATE,TERMINATED,STATUS,SYMBOL,DECIMALS))
#######################################################
cleaned_data_NHPI_2023_24 <- cleaned_data_NHPI %>%
  filter(REF_DATE >="1999-10-01" & REF_DATE <="2009-10-01")
cleaned_data_NHPI_2023_24 <- cleaned_data_NHPI_2023_24 %>%
  filter(GEO == "Canada")
cleaned_data_NHPI_2023_24 <- cleaned_data_NHPI_2023_24 %>%
  filter(`New housing price indexes` == "Total (house and land)")
cleaned_data_NHPI_2023_24 <- cleaned_data_NHPI_2023_24 %>%
  mutate(percent_change = round(((VALUE / 90.8 - 1) * 100),2))
cleaned_data_NHPI_2023_24 <- cleaned_data_NHPI_2023_24 %>%
  select(-c(GEO,`New housing price indexes`))
write_csv(cleaned_data_NHPI_2023_24, "outputs/data/test_data_NHPI.csv")
##############################################
cleaned_data_NHPI <- cleaned_data_NHPI %>%
  filter(REF_DATE >="1999-12-01" & REF_DATE <="2009-10-01")
write_csv(cleaned_data_NHPI, "outputs/data/cleaned_data_NHPI.csv")
cleaned_data_NHPI <- cleaned_data_NHPI %>%
  filter(GEO == "Canada")
cleaned_data_NHPI <- cleaned_data_NHPI %>%
  filter(`New housing price indexes` == "Total (house and land)")
cleaned_data_NHPI <- cleaned_data_NHPI %>%
  mutate(percent_change = round(((VALUE / VALUE[1] - 1) * 100),2))
cleaned_data_NHPI <- cleaned_data_NHPI %>%
  select(-c(GEO,`New housing price indexes`))
###############################################



cleaned_data_NHSR <- raw_data_NHSR %>%
  select(-c( DGUID, UOM, UOM_ID, SCALAR_FACTOR, SCALAR_ID, VECTOR, COORDINATE,TERMINATED,STATUS,SYMBOL,DECIMALS))
cleaned_data_NHSR <- cleaned_data_NHSR %>%
  filter(REF_DATE >="1999-12-01" & REF_DATE <="2009-10-01")
cleaned_data_NHSR <- cleaned_data_NHSR %>%
  filter(GEO == "Canada")

write_csv(cleaned_data_NHSR, "outputs/data/cleaned_data_NHSR.csv")
cleaned_data_NHSR <- cleaned_data_NHSR %>%
  select(-c(GEO))
cleaned_data_NHSR <- cleaned_data_NHSR %>%
  mutate(percent_change = round(((VALUE / VALUE[1] - 1) * 100),2))
####Merge Data####
# Rename the columns as desired
colnames(cleaned_data_cost) <- c("REF_DATE", "Consumption", "Increasing_Rate_Cost")
colnames(test_data_cost) <- c("REF_DATE", "Consumption", "Increasing_Rate_Cost")
colnames(cleaned_data_NHPI) <- c("REF_DATE", "NHPI", "Increasing_Rate_NHPI")
colnames(cleaned_data_NHSR) <- c("REF_DATE", "NHSR", "Increasing_Rate_NHSR")
colnames(cleaned_data_NHPI_2023_24) <- c("REF_DATE", "NHPI", "Increasing_Rate_NHPI")
analysis_data <- merge(cleaned_data_cost, cleaned_data_NHPI, by = "REF_DATE")
#analysis_data <- merge(analysis_data, cleaned_data_NHSR, by = "REF_DATE")
test_data <- merge(test_data_cost, cleaned_data_NHPI_2023_24, by = "REF_DATE")
special_values_2 <- unique(analysis_data$Increasing_Rate_Cost)
print(special_values_2)

#### Save data ####
write_csv(test_data, "outputs/data/test_data.csv")
write_csv(analysis_data, "outputs/data/analysis_data.csv")