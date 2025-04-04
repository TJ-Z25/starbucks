# Generate summary table
library(dplyr)
library(kableExtra)
library(here)

# Load cleaned data
here::i_am("code/01_make_table.R")
data_clean <- readRDS(here("output", "data_clean.rds"))

# Create summary table
summary_table <- data_clean %>%
  group_by(Beverage_category) %>%
  summarise(
    Count = n(),
    # Calories statistics
    Avg_Calories = mean(Calories),
    Median_Calories = median(Calories),
    Min_Calories = min(Calories),
    Max_Calories = max(Calories),
    Q1_Calories = quantile(Calories, 0.25),
    Q3_Calories = quantile(Calories, 0.75),
    
    # Sugar statistics
    Avg_Sugar = mean(Sugars_g),
    Median_Sugar = median(Sugars_g),
    Min_Sugar = min(Sugars_g),
    Max_Sugar = max(Sugars_g),
    Q1_Sugar = quantile(Sugars_g, 0.25),
    Q3_Sugar = quantile(Sugars_g, 0.75),
    
    # Fat statistics
    Avg_Fat = mean(Total_Fat_g),
    Median_Fat = median(Total_Fat_g),
    Min_Fat = min(Total_Fat_g,default = NA),
    Max_Fat = max(Total_Fat_g,default = NA),
    Q1_Fat = if(all(is.na(Total_Fat_g))) NA_real_ else quantile(Total_Fat_g, 0.25, na.rm = TRUE),
    Q3_Fat = if(all(is.na(Total_Fat_g))) NA_real_ else quantile(Total_Fat_g, 0.75, na.rm = TRUE)
  )

saveRDS(summary_table, here("output", "table_summary.rds"))

# Calories statistics table
calories_stats <- summary_table %>%
  select(Beverage_category, Count, starts_with("Avg_Cal"), 
         starts_with("Median_Cal"), starts_with("Min_Cal"), 
         starts_with("Max_Cal"), starts_with("Q1_Cal"), 
         starts_with("Q3_Cal"))

# Sugar statistics table
sugar_stats <- summary_table %>%
  select(Beverage_category, Count, starts_with("Avg_Sugar"), 
         starts_with("Median_Sugar"), starts_with("Min_Sugar"), 
         starts_with("Max_Sugar"), starts_with("Q1_Sugar"), 
         starts_with("Q3_Sugar"))

# Fat statistics table
fat_stats <- summary_table %>%
  select(Beverage_category, Count, starts_with("Avg_Fat"), 
         starts_with("Median_Fat"), starts_with("Min_Fat"), 
         starts_with("Max_Fat"), starts_with("Q1_Fat"), 
         starts_with("Q3_Fat"))

# Save these formatted tables
saveRDS(calories_stats, here("output", "calories_stats.rds"))
saveRDS(sugar_stats, here("output", "sugar_stats.rds"))
saveRDS(fat_stats, here("output", "fat_stats.rds"))