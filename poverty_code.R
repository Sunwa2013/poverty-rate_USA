#installing neccessary packages
install.packages("ggplot2")
install.packages("dblyr")
install.packages("gifski")
install.packages("av")
install.packages("gganimate")
install.packages("transformr")
install.packages("rlang")
install.packages("tidyverse")
install.packages("pacman")
install.packages("renv")


#checking the neccessary packages
require(renv)
library(renv)
library(ggplot2)
library(dblyr)
library(rlang)
library(tidyverse)
options(warn = -1)
library(gifski)
library(av)
library(gganimate)
library(transformr)
require(pacman)

pacman::p_load(pacman,dplyr,tidyr,ggvis,ggplot2,httr,plotly,rio,ggthemes,lubridate,stringr)

library(pacman)

#loading the data and saving it.
data <- read.csv("D:/DATA/R/poverty_work/poverty.csv")

#inspect data
head(data)

#check the year
unique(data$Year)

#states available?
length(unique(data$Name))

#Name <- c("United States")
data %>% filter(Name =="United States") %>% ggplot() +
geom_line(aes(Year, Percent.in.Poverty), size = 1.0, color="#3FA796") +
scale_x_continuous(limits = c(2011, 2021), breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021)) +
ggtitle("Poverty rate in the United States", subtitle = "Between years 2011 - 2021") +  
ylab("Poverty in percentage") +  
  theme(plot.background = element_rect(fill="#F5EDDC"),
        panel.background = element_rect(fill = "#F5EDDC"),
        panel.grid.major = element_blank(),
        plot.title = element_text(size = 25, family = "News Gothic Condensed", margin=margin(10,0,10,0)),
        plot.subtitle = element_text(size = 15, family = "News Gothic Condensed", margin=margin(0,0,10,0)),
        axis.text.x = element_text(size = 10, family = "News Gothic Condensed"),
        axis.title.x =  element_text(size = 15, family = "News Gothic Condensed", margin=margin(10,0,10,0)),
        axis.text.y = element_text(size = 10, family = "News Gothic Condensed"),
        axis.title.y =  element_text(size = 15, family = "News Gothic Condensed", margin=margin(0,8,0,11)),
        plot.margin = margin(0,0.5,0,0, "cm"))  
#sel <- data %>% select(Poverty.in.Poverty) %>% summary()
#sel
min <- which(data$Percent.in.Poverty == 7.00)
data$Name[min]
max <- which(data$Percent.in.Poverty == 23.90)
data$Name[max]

data %>% filter(Name %in% c("Mississippi","New Hampshire","United States")) %>% ggplot() +
geom_line(aes(Year, Percent.in.Poverty, color = Name), size = 1.5) +
scale_x_continuous(limits = c(2011,2021),breaks = c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021)) +  
scale_y_continuous(limits = c(7,24),breaks = c(7,10,15,20,24)) +
ggtitle("Poverty rate in the United States",subtitle = "Between years 2011-2021") + 
ylab("Poverty in percentage") + 
theme(plot.background = element_rect(fill="#F5EDDC"),
      panel.background = element_rect(fill="#F5EDDC"),
      panel.grid.minor = element_blank(),      
      plot.title = element_text(size = 25, family = "News Gothic Condensed", margin=margin(10,0,10,0)),
      plot.subtitle = element_text(size = 15, family = "News Gothic Condensed", margin=margin(0,0,10,0)),
      axis.text.x = element_text(size = 10, family = "News Gothic Condensed"),
      axis.title.x = element_text(size = 15, family = "News Gothic Condensed", margin=margin(10,0,10,0)),
      axis.text.y = element_text(size = 10, family = "News Gothic Condensed"),
      axis.title.y =  element_text(size = 15, family = "News Gothic Condensed", margin=margin(0,8,0,11)),
      plot.margin = margin(0,0.1,0,0, "cm"),
      legend.background =element_rect(fill="#F5EEDC"),
      legend.key =element_rect(fill="#F5EEDC")) +
  scale_color_manual(values = c("#ECB390", "#632626", "#1572A1")) +
  labs(color="State", family = "News Gothic Condensed", size = 15)
warning()
      