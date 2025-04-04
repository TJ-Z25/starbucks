# Generate boxplot visualization
library(ggplot2)
library(here)

here::i_am("code/02_make_boxplot.R")
data_clean <- readRDS(here("output", "data_clean.rds"))

# Create boxplot
p <- ggplot(data_clean, aes(x = Beverage_category, y = Calories, fill = Beverage_category)) +
  geom_boxplot() +
  labs(title = "Calories Distribution Across Beverage Categories",
       x = "Beverage Category",
       y = "Calories") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave(here("output", "calories_boxplot.png"), p, width = 10, height = 6)