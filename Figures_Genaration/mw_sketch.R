library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(ggforce) # add bracket under the window line

mw_scketch <- data.frame("Time" = c("00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00"))

#mw_scketch$Time <- hms(paste0(mw_scketch$Time, ":00"))

mw_scketch$Time <- as.POSIXct(mw_scketch$Time, format = "%H:%M:%S")

mw_scketch %>%
  ggplot(aes(x = Time)) +
  
  # add color for overlapped areas
  geom_rect(aes(xmin = as.POSIXct("02:00:00", format="%H:%M:%S"), xmax = as.POSIXct("03:00:00", format="%H:%M:%S"), ymin = 1, ymax = 2),
            fill = "#FFEDDA") + 
  #geom_rect(aes(xmin = as.POSIXct("02:00:00", format="%H:%M:%S"), xmax = as.POSIXct("03:00:00", format="%H:%M:%S"), ymin = 2, ymax = 3),
  #          fill = "#FFEDDA") +
  #geom_rect(aes(xmin = as.POSIXct("03:00:00", format="%H:%M:%S"), xmax = as.POSIXct("04:00:00", format="%H:%M:%S"), ymin = 3, ymax = 4),
  #          fill = "#FFEDDA") +
  
  # add texts of Overlap (1 Hour)
  geom_text(aes(x = as.POSIXct("02:30:00", format="%H:%M:%S"), y = 1.5, label = "Overlap"), 
            color = "black", size = 2.5, fontface = "italic") +
  #geom_text(aes(x = as.POSIXct("02:30:00", format="%H:%M:%S"), y = 2.5, label = "Overlap (1 Hour)"), 
  #          color = "black", size = 2.5, fontface = "italic") +
  #geom_text(aes(x = as.POSIXct("03:30:00", format="%H:%M:%S"), y = 3.5, label = "Overlap (1 Hour)"), 
  #          color = "black", size = 2.5, fontface = "italic") +
  
  # add windows' horizontal lines
  geom_segment(aes(x = as.POSIXct("00:00:00", format="%H:%M:%S"), y = 1, xend = as.POSIXct("03:00:00", format="%H:%M:%S"), yend = 1)) +
  geom_segment(aes(x = as.POSIXct("02:00:00", format="%H:%M:%S"), y = 2, xend = as.POSIXct("05:00:00", format="%H:%M:%S"), yend = 2)) +
  geom_segment(aes(x = as.POSIXct("04:00:00", format="%H:%M:%S"), y = 3, xend = as.POSIXct("07:00:00", format="%H:%M:%S"), yend = 3)) +
  #geom_segment(aes(x = as.POSIXct("03:00:00", format="%H:%M:%S"), y = 4, xend = as.POSIXct("05:00:00", format="%H:%M:%S"), yend = 4)) +
  
  # add vertical overlaped lines
  geom_segment(aes(x = as.POSIXct("02:00:00", format="%H:%M:%S"), y = 1, xend = as.POSIXct("02:00:00", format="%H:%M:%S"), yend = 2), 
               linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  geom_segment(aes(x = as.POSIXct("03:00:00", format="%H:%M:%S"), y = 1, xend = as.POSIXct("03:00:00", format="%H:%M:%S"), yend = 2), 
               linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  geom_segment(aes(x = as.POSIXct("04:00:00", format="%H:%M:%S"), y = 2, xend = as.POSIXct("04:00:00", format="%H:%M:%S"), yend = 3), 
               linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  geom_segment(aes(x = as.POSIXct("05:00:00", format="%H:%M:%S"), y = 2, xend = as.POSIXct("05:00:00", format="%H:%M:%S"), yend = 3), 
               linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  #geom_segment(aes(x = as.POSIXct("03:00:00", format="%H:%M:%S"), y = 3, xend = as.POSIXct("03:00:00", format="%H:%M:%S"), yend = 4), 
  #             linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  #geom_segment(aes(x = as.POSIXct("04:00:00", format="%H:%M:%S"), y = 3, xend = as.POSIXct("04:00:00", format="%H:%M:%S"), yend = 4), 
  #             linetype = "dashed", color = brewer.pal(n = 7, name = "Set1")[1]) +
  scale_x_datetime(date_breaks = "1 hour", date_labels = "%H:%M") +
  
  # add little cap of each window
  geom_segment(aes(x = as.POSIXct("00:00:00", format="%H:%M:%S"), y = 0.9, xend = as.POSIXct("00:00:00", format="%H:%M:%S"), yend = 1.1), 
               linetype = "solid", color = "black") +
  geom_segment(aes(x = as.POSIXct("03:00:00", format="%H:%M:%S"), y = 0.9, xend = as.POSIXct("03:00:00", format="%H:%M:%S"), yend = 1.1), 
               linetype = "solid", color = "black") +
  geom_segment(aes(x = as.POSIXct("02:00:00", format="%H:%M:%S"), y = 1.9, xend = as.POSIXct("02:00:00", format="%H:%M:%S"), yend = 2.1), 
               linetype = "solid", color = "black") +
  geom_segment(aes(x = as.POSIXct("05:00:00", format="%H:%M:%S"), y = 1.9, xend = as.POSIXct("05:00:00", format="%H:%M:%S"), yend = 2.1), 
               linetype = "solid", color = "black") +
  geom_segment(aes(x = as.POSIXct("04:00:00", format="%H:%M:%S"), y = 2.9, xend = as.POSIXct("04:00:00", format="%H:%M:%S"), yend = 3.1), 
               linetype = "solid", color = "black") +
  geom_segment(aes(x = as.POSIXct("07:00:00", format="%H:%M:%S"), y = 2.9, xend = as.POSIXct("07:00:00", format="%H:%M:%S"), yend = 3.1), 
               linetype = "solid", color = "black") +
  #geom_segment(aes(x = as.POSIXct("03:00:00", format="%H:%M:%S"), y = 3.9, xend = as.POSIXct("03:00:00", format="%H:%M:%S"), yend = 4.1), 
  #             linetype = "solid", color = "black") +
  #geom_segment(aes(x = as.POSIXct("05:00:00", format="%H:%M:%S"), y = 3.9, xend = as.POSIXct("05:00:00", format="%H:%M:%S"), yend = 4.1), 
  #             linetype = "solid", color = "black") +
  
  # add texts under windows
  geom_text(aes(x = as.POSIXct("01:30:00", format="%H:%M:%S"), y = 0.7, label = "Window 1"), 
            color = "black", size = 2.5, fontface = "italic") +
  geom_text(aes(x = as.POSIXct("03:30:00", format="%H:%M:%S"), y = 1.7, label = "Window 2"), 
            color = "black", size = 2.5, fontface = "italic") +
  geom_text(aes(x = as.POSIXct("05:30:00", format="%H:%M:%S"), y = 2.7, label = "Window 3"), 
            color = "black", size = 2.5, fontface = "italic") +
  #geom_text(aes(x = as.POSIXct("04:00:00", format="%H:%M:%S"), y = 3.6, label = "Window 4"), 
  #          color = "black", size = 2.5, fontface = "italic") +
  
  # add bracket
  # add bracket between text and line for Window 1
  #geom_curve(aes(x = as.POSIXct("00:00:00", format="%H:%M:%S"), y = 1, xend = as.POSIXct("02:00:00", format="%H:%M:%S"), yend = 1),
  #           curvature = 0.08, color = "black") +
  
  
  
  # add the labs 
  labs(title = "Moving Window Approach",
     x = "Time (Hour)",
     y = "") +
  # remove the marked scale on y axis
  scale_y_continuous(breaks=NULL) +
  theme_bw() +
  theme(plot.title = element_text(face = "italic", family = "serif"),
        axis.text = element_text(family = "serif"),
        axis.title = element_text(family = "serif"),
        legend.position = "right",
        legend.text = element_text(family = "serif"),
        legend.title = element_text(face = "italic", family = "serif"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        # remove the values on y axis
        axis.text.y = element_blank())
