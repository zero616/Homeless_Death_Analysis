#### Preamble ####
# Purpose: Downloads and saves the data from opentoronto
# Author:Shipeng Zhang
# Date: 22 January 2024
# Contact: shipeng.zhang@mail.utoronto.ca
# License: MIT


#### Workspace setup #### 
library("janitor")
library("knitr")
library("lubridate")
library("opendatatoronto")
library("tidyverse")
library("dplyr")


#### Download data ####
packages <- list_packages(limit = 20)
packages

search <- search_packages("homeless")
find = list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")

toronto_homeless_death <- list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")|>
  dplyr::filter(name == "Homeless deaths by cause.csv") |>
  get_resource()
#### Save data ####
write_csv(x=toronto_homeless_death , file = "inputs/data/raw_data.csv") 

         
