


library(tidyverse)
library(ggforce)
library(ggtext)
library(patchwork)


circles <- data.frame(
  x0 = rep(0, 5),
  y0 = rep(0, 5),
  r = seq(0.1, 1, length.out = 5)
)

data.av <- tibble(x = rnorm(1e3, 0, 0.1),
                  y = rnorm(1e3, 0, 0.1),
                  group = "Valid, Accurate") 

data.anv <- tibble(x = rnorm(1e3, 0.5, 0.1),
                  y = rnorm(1e3, 0.5, 0.1),
                  group = "Not Valid, Accurate") 

data.nav <- tibble(x = rnorm(1e3, 0, 0.25),
                   y = rnorm(1e3, 0, 0.25),
                   group = "Valid, Not Accurate") 

data.nanv <- tibble(x = rnorm(1e3, -0.5, 0.25),
                   y = rnorm(1e3, -0.6, 0.25),
                   group = "Not Valid, Not Accurate") 



plot.av <- ggplot() +
  geom_circle(data = circles, aes(x0 = x0, y0 = y0, r = r, fill = r), alpha = 0.4, show.legend = FALSE) +
  geom_point(data = data.av, aes(x = x, y = y), fill = "maroon", alpha = .8, size = 2, pch = 21) +
  coord_fixed() +
  theme_void() +
  theme(title = element_markdown(size = 15, face = "bold")) +
  scale_x_continuous(limits = c(-1.25, 1.25)) +
  scale_y_continuous(limits = c(-1.25, 1.25)) +
  labs(title = "Valid, Accurate")


plot.anv <- ggplot() +
  geom_circle(data = circles, aes(x0 = x0, y0 = y0, r = r, fill = r), alpha = 0.4, show.legend = FALSE) +
  geom_point(data = data.anv, aes(x = x, y = y), fill = "maroon", alpha = .8, size = 2, pch = 21) +
  coord_fixed() +
  theme_void() +
  theme(title = element_markdown(size = 15, face = "bold")) +
  scale_x_continuous(limits = c(-1.25, 1.25)) +
  scale_y_continuous(limits = c(-1.25, 1.25)) +
  labs(title = "Not Valid, Accurate")

plot.nav <- ggplot() +
  geom_circle(data = circles, aes(x0 = x0, y0 = y0, r = r, fill = r), alpha = 0.4, show.legend = FALSE) +
  geom_point(data = data.nav, aes(x = x, y = y), fill = "maroon", alpha = .8, size = 2, pch = 21) +
  coord_fixed() +
  theme_void() +
  theme(title = element_markdown(size = 15, face = "bold")) +
  scale_x_continuous(limits = c(-1.25, 1.25)) +
  scale_y_continuous(limits = c(-1.25, 1.25)) +
  labs(title = "Valid, Not Accurate")


plot.nanv <- ggplot() +
  geom_circle(data = circles, aes(x0 = x0, y0 = y0, r = r, fill = r), alpha = 0.4, show.legend = FALSE) +
  geom_point(data = data.nanv, aes(x = x, y = y), fill = "maroon", alpha = .8, size = 2, pch = 21) +
  coord_fixed() +
  theme_void() +
  theme(title = element_markdown(size = 15, face = "bold")) +
  scale_x_continuous(limits = c(-1.25, 1.25)) +
  scale_y_continuous(limits = c(-1.25, 1.25)) +
  labs(title = "Not Valid, Not Accurate")



plot.com <- wrap_plots(plot.av, plot.nav, plot.anv, plot.nanv)

plot.com
