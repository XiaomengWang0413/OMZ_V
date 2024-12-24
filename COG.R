#eggnog注释后会有很多蛋白序列注释到多个代谢模块，利用该脚本进行分列#

setwd("D:\\实验分析\\05_Virus\\2024-12-24-BoB\\Fig\\05_COG")

# 读取CSV文件
data <- read.csv("COG.csv", stringsAsFactors = FALSE)

# 确保COG_category列存在
if("COG_category" %in% colnames(data)){
  # 拆分包含多个字母的行
  library(dplyr) # 加载dplyr包
  library(tidyr) # 加载tidyr包
  
  data_split <- data %>%
    mutate(COG_category = strsplit(COG_category, "")) %>% # 按字母分割
    unnest(COG_category)                                 # 拆分成多行
  
