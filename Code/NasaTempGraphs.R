library(tidyverse)
read.csv("NasaTemp Data/GLB.Ts+dSST.csv",skip = 1, na= "***") %>% 
  select(year = `Year`, t_diff = `J.D`) %>% drop_na() %>% 
  ggplot(aes(x=year,y=t_diff))+
  geom_line(color = "gray")+
  geom_point(fill= "white",color = "gray",shape =21)+
  geom_smooth(se=FALSE, color= "black",size= 0.5,span=0.15)+
  scale_x_continuous(breaks = seq(1800,2023,20),expand = c(0,0))+
  scale_y_continuous(limits = c(-0.5,1.5),expand = c(0,0))+
  labs(x = "years",y = "temperature",
       title = "Global Land ocean temperature INDEX",
       subtitle = "NASA Goddard Institute for space studied (GISS).\nCredit:NASA/GISS")+
  theme_light()+
  theme(axis.ticks = element_blank(),
        plot.title.position = "plot",
        plot.title = element_text(margin = margin(b=10),colour = "red",face = "bold"),
        plot.subtitle = element_text(size = 8, margin = margin(b=10)))
tail(climate)

climate %>% drop_na() %>% tail()
ggsave("Figers/temperature_plot_1.png",
       width=6, height = 4)