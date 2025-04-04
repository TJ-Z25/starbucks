# Render the final report
library(rmarkdown)
library(here)

here::i_am(("code/04_render_report.R"))

# Render the R markdown to HTML
render(here("final_project_starbucks.Rmd"),
       output_file = "starbucks_analysis_report.html",
       output_dir = here("output"))