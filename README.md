# Homeless Death Analysis in Toronto

## Overview

This project analyzes the tragic reality of homelessness in Toronto, focusing on the impact of drug addiction by examining homeless death toll data from 2017 to 2023. The findings reveal a concerning rise in addiction-related homeless deaths over the years.

## File Structure
```
Homeless_Death_Analysis
|   .gitignore
|   .RData
|   .Rhistory
|   Homeless_Death_Analysis.Rproj
|   LICENSE
|   README.md
|   
+---inputs  
|   +---data
|   |       plane_data.csv
|   |       raw_data.csv
|   |       
|   +---literature
|   |       Alexander-ProjectOfStateLevel.pdf
|   |       
|   +---llm
|   |       usage.txt
|   |       
|   \---sketches
|           dataset.pdf
|           graph.pdf
|           
+---outputs
|   +---data
|   |       analysis_data.csv
|   |       cleaned_data.csv
|   |       
|   \---paper
|           datasheet_template.pdf
|           datasheet_template.qmd
|           paper.pdf
|           paper.qmd
|           references.bib
|           
\---scripts
        00-simulate_data.R
        01-download_data.R
        02-data_cleaning.R
        03-test_data.R
        04-model.R
```

## Data Source

The data set used in this analysis was obtained from the City of Toronto's OpenDataToronto Library. It includes information such as year of death, cause of death, age group, gender, and number of people.

## Installation

To run the analysis, you need R and the following R packages:

- janitor
- knitr
- lubridate
- opendatatoronto
- tidyverse

You can install these packages using the following R code:

```{r}
install.packages(c("janitor", "knitr", "lubridate", "opendatatoronto", "tidyverse"))
```
# Statement on LLM Usage

This project does not make use of any Language Model (LLM) in its analysis, code, or documentation.