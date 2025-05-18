file_path <- '这里写数据来源文件路径'
data <- read.csv(file_path)

library(ggplot2)
library(ggridges)

# 为每个组别设置颜色
my_colors <- c("组别1" = "#b6d3ec", "组别2" = "#f2c68c", "组别3" = "#f1beb2", "组别4" = "#bcbec1", "组别5" = "#c2dfc0", "组别6" = "#d3c2db")

# 自定义option列的因子水平顺序
data$组别 <- factor(data$组别, levels = c("组别1", "组别2", "组别3", "组别4", "组别5", "组别6"))

# 绘制山峦图，并为每个组别设置自定义颜色
p <- ggplot(data, aes(x = 横轴变量名, y = 组别, fill = 组别)) +
  geom_density_ridges() +
  scale_fill_manual(values = my_colors) + # 手动设置颜色
  theme_ridges()# 使用ggridges包的主题设置

p <- p + theme(axis.title.y = element_blank()) + #去除轴标题
         theme(axis.text = element_text(size = 17)) +
         theme(axis.text.y = element_blank()) +
         theme(axis.title.x = element_text(size = 20)) #控制横轴标题的大小

print(p)
