---
Title: Starbucks Analysis Report
Author: Tianjie Zhang
Output: html_document
Date: 2025-04-04
---

# Starbucks Nutritional Analysis

## Project Overview
This project analyzes the nutritional composition of Starbucks beverages, exploring relationships between variables and classifying the beverages as healthy or not. The analysis provides actionable insights for consumers and contributes to a broader discussion of dietary health.

## Data Description
The dataset contains 242 observations of Starbucks beverages across 18 variables, including:

### Beverage category (e.g., coffee, tea, smoothies)
### Beverage name and preparation method
### Nutritional information:

  Calories
  Sugars (g)
  Total Fat (g)
  Saturated Fat (g)
  Trans Fat (g)
  Sodium (mg)
  Total Carbohydrates (g)
  Cholesterol (mg)
  Dietary Fiber (g)
  Protein (g)
  Vitamin content
  Caffeine content

## Analysis Components
1. Data Cleaning (00_clean_data.R)

  Reads the original Starbucks CSV file
  Handles missing values
  Converts categorical variables to factors
  Ensures consistent data types (particularly for Total_Fat_g)
  Saves cleaned data to RDS format

2. Summary Statistics (01_make_table.R)

  Generates comprehensive statistics by beverage category
  Calculates mean, median, min, max, and quartiles for:

    *Calories
    *Sugar content
    *Fat content
  
  Creates separate tables for each nutritional category
  Saves results to RDS format

3. Data Visualization (02_make_boxplot.R)

  Creates boxplot showing calorie distribution across beverage categories
  Uses ggplot2 with minimal theme
  Visualizes outliers and range of calories
  Saves plot as PNG file

4. Top Calories Analysis (03_make_top5.R)

  Identifies the 5 beverages with highest calorie content
  Sorts data in descending order of calories
  Saves results to RDS format

5. Report Generation (04_render_report.R)

  Renders R Markdown document into HTML report
  Incorporates all analysis components
  Presents findings in a structured format

## How to Run the Analysis

### Prerequisites
R with the following packages:

  readr
  dplyr
  ggplot2
  kableExtra
  here
  rmarkdown
  tidyr

### Users should use `cd` in their terminal to navigate to a directory where they wish to download this repository

### Using Make
The entire analysis can be run using the provided Makefile:

#### To build the entire project:

  `make`

#### To generate individual components:

  `make output/data_clean.rds`                 # Clean data
  `make output/table_summary.rds`              # Generate summary tables
  `make output/calories_boxplot.png`           # Create visualizations
  `make descriptive_analysis`                  # Run descriptive analysis
  `make graphical_analysis`                    # Run graphical analysis
  `make output/starbucks_analysis_report.html` # Render final report

#### To clean all generated files:

  `make clean`
  
## Environment Reproducibility

This project uses the `renv` package to ensure reproducible environments across different systems.

### Setting up the environment

1. Clone this repository
2. Open the project in RStudio
3. Run `make install` in the terminal or execute `renv::restore()` in R console
4. All required packages with the correct versions will be installed automatically

This ensures that you'll have exactly the same package versions that were used to create this analysis.

### Managing package changes

If you need to add new packages to the project:

1. Install the new package using `install.packages("package_name")`
2. Run `renv::snapshot()` to update the lockfile with the new dependency
3. Commit the updated renv.lock file to the repository

For more information on renv, see the [official documentation](https://rstudio.github.io/renv/).