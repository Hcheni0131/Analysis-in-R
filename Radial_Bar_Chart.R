setwd("Path_to/Data.txt")
library(tidyverse)
library(ggplot2)
data_main<- read.table("Data.txt",sep = "\t",header = TRUE)
data_points<-read.table("Data.txt",sep="\t",header=TRUE)
data_points$NAME<-gsub("","_",data_points$NAME)
species_to_show<-data_points%>%
group_by(NAME)%>%
tally()%>%
filter(n>1)%>%
pull(NAME)
data_points_filtered<-data_points%>%
filter(NAME%in%species_to_show)
level<-rev(data_main$Name)
data_main$Name<-factor(data_main$Name,levels=level)
data_points_filtered$NAME<-factor(data_points_filtered$NAME,levels=level)
ggplot()+geom_col(data=data_main,aes(x=Name,y=ATG),fill="#cccccc")+geom_errorbar(data=data_main,aes(x=Name,ymin=ATG-SEM,ymax=ATG+SEM),width=0.4)+geom_jitter(data=data_points_filtered,aes(x=NAME,y=REL),shape=21,fill="#cccccc",color="black",size=0.3,stroke=0.1,alpha=1,width=0.2,height=0)+scale_y_continuous(limits=c(-5,6))+coord_polar(start=-0.1*pi,clip="off")+theme_minimal()
