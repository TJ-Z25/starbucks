all: output/starbucks_analysis_report.html
	cp output/starbucks_analysis_report.html /report/
	cp -r output/table_summary.rds /report/ || true
	cp -r output/calories_boxplot.png /report/ || true
	cp -r output/top5_calories.rds /report/ || true

output/data_clean.rds: code/00_clean_data.R starbucks.csv
	Rscript code/00_clean_data.R

output/table_summary.rds: code/01_make_table.R output/data_clean.rds
	Rscript code/01_make_table.R

output/calories_boxplot.png: code/02_make_boxplot.R output/data_clean.rds
	Rscript code/02_make_boxplot.R

output/top5_calories.rds: code/03_make_top5.R output/data_clean.rds
	Rscript code/03_make_top5.R

output/starbucks_analysis_report.html: code/04_render_report.R output/table_summary.rds output/calories_boxplot.png output/top5_calories.rds
	Rscript code/04_render_report.R

docker-build:
	docker build -t tjz25/starbucks:latest .

docker-run:
	mkdir -p $(PWD)/report
	docker run --rm -v $(PWD)/report:/report tjz25/starbucks:latest

.PHONY: all docker-build docker-run