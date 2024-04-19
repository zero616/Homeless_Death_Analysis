  #### Preamble ####
  # Purpose: Models... [...UPDATE THIS...]
  # Author: Rohan Alexander [...UPDATE THIS...]
  # Date: 11 February 2023 [...UPDATE THIS...]
  # Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
  # License: MIT
  # Pre-requisites: [...UPDATE THIS...]
  # Any other information needed? [...UPDATE THIS...]
  
  
  #### Workspace setup ####
  library(tidyverse)
  library(rstanarm)
  
  analysis_data <- read_csv("outputs/data/analysis_data.csv")
  
  linear_model <- lm(Increasing_Rate_Cost ~ Increasing_Rate_NHPI, data = analysis_data)
  
  # Summary of the model
  summary(linear_model)

  
  # Get predicted values from the linear model
  predicted_values <- predict(linear_model)
  
  # Create a scatter plot of observed vs. predicted values
  ggplot(analysis_data, aes(x = Increasing_Rate_Cost, y = predicted_values)) +
    geom_point() +
    geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +  # Add diagonal line for reference
    labs(x = "Observed Consumption", y = "Predicted Consumption", title = "Observed vs. Predicted Consumption")
  #### Save model ####
  saveRDS(
    model_poly,
    file = "models/model.rds"
  )
  ggplot(analysis_data, aes(x = NHPI, y = Consumption)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add fitted line
    labs(x = "NHPI", y = "Consumption", title = "Scatter plot of Consumption vs. NHPI")
  
  
  
