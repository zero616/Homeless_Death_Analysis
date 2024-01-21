#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup #### 
library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")
library(dplyr)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

packages <- list_packages(limit = 20)
packages

search <- search_packages("homeless")
find = list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")

toronto_homeless_death <- list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")|>
  dplyr::filter(name == "Homeless deaths by cause.csv") |>
  get_resource()
#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(x=toronto_homeless_death , file = "inputs/data/raw_data.csv") 

         
