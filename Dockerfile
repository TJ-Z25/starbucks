FROM rocker/verse:4.4.1

# Working Directory
WORKDIR /project

# Install all required R packages
RUN install2.r --error --deps TRUE \
    dplyr \
    readr \
    ggplot2 \
    knitr \
    rmarkdown \
    kableExtra \
    here

# Copying project files
COPY . /project/

# Creating an output directory
RUN mkdir -p /project/output
RUN mkdir -p /report

CMD make all