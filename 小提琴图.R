file_path <- '这里写文件路径'
data <- read.csv(file_path)

library(ggplot2)
library(dplyr) 
library(rstatix) 
library(ggpubr)

# 组别：为列名，这列数据为各个组别的名称，假设有6个组别
data$组别 <- factor(data$option, levels = c("组别1", "组别2", "组别3", "组别4", "组别5", "组别6L"))

p <- ggplot(data, aes(x = 组别, y = 因变量, fill = 组别, color = 组别)) +
  scale_fill_manual(values = c("#bcbec1", "#f1beb2", "#c2dfc0", "#b6d3ec", "#d3c2db","#f2c68c")) +
  scale_colour_manual(values = c("#4d454b", "#a15810", "#37593c", "#3a5478", "#472d78", "#5d5727"))

# 画小提琴图
p <- p + geom_violin(
    adjust = 1.2, trim = FALSE, color = NA, alpha = 0.6
)

# 添加箱线图
p <- p + geom_boxplot(
    outlier.shape = NA, # 隐藏离群点
    width = 0.1,
    alpha = 0.8
)

# (背景)
p <- p + theme_classic() +
         theme(axis.title = element_blank()) + #去除轴标签
         theme(axis.text = element_text(size = 17)) + #定义轴标签的字体大小
         theme(legend.position = "none") +
         theme(axis.text.x = element_text(angle = 30, hjust = 1))

# 打印图形
print(p)
