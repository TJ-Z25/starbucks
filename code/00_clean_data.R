# Read and clean the Starbucks data
library(readr)
library(dplyr)
library(here)

here::i_am("code/00_clean_data.R")
data <- read.csv(here("starbucks.csv"), header = TRUE)

data_clean <- data %>%
  na.omit() %>%
  mutate(Beverage_category = as.factor(Beverage_category),
         Beverage = as.factor(Beverage),
         Total_Fat_g = as.numeric(as.character(Total_Fat_g)))

saveRDS(data_clean, here("output", "data_clean.rds"))