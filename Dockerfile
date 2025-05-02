FROM rocker/verse:4.4.1

# 工作目录
WORKDIR /project

# 安装所有需要的R包
RUN install2.r --error --deps TRUE \
    dplyr \
    readr \
    ggplot2 \
    knitr \
    rmarkdown \
    kableExtra \
    here

# 复制项目文件
COPY . /project/


# 创建输出目录
RUN mkdir -p /project/output
RUN mkdir -p /report

# 命令
CMD make all