setwd("Path_to/Data.txt)
data <- read.table("Data.txt",sep = "\t",header = TRUE)
head(data)
library(ggplot2)
library(dplyr)
level <- data[,1]
level <- rev(level)
data$name <- factor(data$name,level=level)
ggplot(data,aes(x=P,y=name))+geom_point()+geom_segment(aes(x=P,xend=0,y=name,yend=name),color="#3C3530",linetype="solid",size=1.5)+
geom_point(color="#3C3530",fill="#91A8D0",shape=21,size=5)+theme_minimal()+xlim(0,1)
