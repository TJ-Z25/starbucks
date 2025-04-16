# Rule to restore the R package environment
install:
	Rscript -e "renv::restore()"

output/starbucks_analysis_report.html: code/04_render_report.R output/table_summary.rds output/calories_boxplot.png output/top5_calories.rds
	Rscript code/04_render_report.R
	
output/data_clean.rds: code/00_clean_data.R starbucks.csv
	Rscript code/00_clean_data.R

output/table_summary.rds: code/01_make_table.R output/data_clean.rds
	Rscript code/00_clean_data.R && Rscript code/01_make_table.R ## && indicates that the second syntax is executed only when the first syntax is OK

output/calories_boxplot.png: code/02_make_boxplot.R output/data_clean.rds
	Rscript code/02_make_boxplot.R

output/top5_calories.rds: code/03_make_top5.R output/data_clean.rds
	Rscript code/03_make_top5.R

.PHONY: all descriptive_analysis graphical_analysis clean

descriptive_analysis: output/table_summary.rds output/top5_calories.rds

graphical_analysis: output/calories_boxplot.png

clean:
	rm -f output/*.rds output/*.png output/*.html