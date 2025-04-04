# Generate top 5 calories table
library(dplyr)
library(here)

# Load cleaned data
here::i_am("code/03_make_top5.R")
data_clean <- readRDS(here("output", "data_clean.rds"))

# Create top 5 calories table
top5_calories <- data_clean %>%
  arrange(desc(Calories)) %>%
  select(Beverage, Calories) %>%
  head(5)

# Save the results
saveRDS(top5_calories, here("output", "top5_calories.rds"))