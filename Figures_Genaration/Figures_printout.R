p2 + p1 + plot_layout(ncol = 2, widths = c(1, 1)) +
  theme(legend.position = "right")


p3 + p4 + p5 + plot_layout(ncol = 3, widths = c(1/3, 1/3, 1/3)) +
  theme(legend.position = "right")

p6 + p7 + plot_layout(ncol = 3, widths = c(1/3, 1/3)) +
  theme(legend.position = "right")

p6 + p7 + plot_layout(ncol = 2, widths = c(1/2, 1/2)) +
  theme(legend.position = "right")

ggplot(winpar_long, aes(x = window, y = parameter, color = effect)) +
  geom_point() +
  scale_color_brewer(palette = "Set1", guide = "legend") +
  labs(x = "Window", 
       y = "Parameter", 
       color = "Effect") +
  theme_bw() +
  theme(plot.title = element_text(face = "italic", family = "serif"),
        axis.text = element_text(family = "serif"),
        axis.title = element_text(family = "serif"),
        legend.position = "right",
        legend.text = element_text(family = "serif"),
        legend.title = element_text(face = "italic", family = "serif"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        #panel.border = element_blank(),
        panel.background = element_blank())


indegreeReceiver_cpd.plot +
  inertia_cpd.plot +
  outdegree_cpd.plot + 
  psABBA_cpd.plot +
  psABBY_cpd.plot +
  psABXA_cpd.plot +
  totSender_cpd.plot +
  plot_layout(ncol = 2, widths = c(1,1)) +
  theme(legend.position = "bottom",
        legend.box = "horizontal",
        # legend x and y position
        legend.justification = c(6, 2.3),
        # legend height of the entire plot
        legend.margin = margin(t = -1.8, r = 0, b = 0, l = 0, unit = "cm"),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 14),
        legend.key.size = unit(0.8, "cm"))

sender_plot +
  difference_plot + 
  inertia_plot +
  outdegreesender_plot +
  plot_layout(ncol = 2, widths = c(1,1))
