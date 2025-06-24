library(dplyr)
library(ggplot2)

wicket_data <- deliveries %>%
  group_by(over) %>%
  summarise(wicket_prob = mean(is_wicket, na.rm = TRUE))

ggplot(wicket_data, aes(x = factor(over), y = wicket_prob, fill = wicket_prob)) +
  geom_col(color = "black", width = 0.7) +
  geom_text(aes(label = round(wicket_prob, 3)), vjust = -0.3, fontface = "bold") +
  scale_fill_gradient(low = "yellow", high = "red") +
  theme_minimal(base_size = 14) +
  labs(
    title = "Wicket Probability per Over",
    x = "Over Number",
    y = "Wicket Probability"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.text.x = element_text(face = "bold"),
    axis.text.y = element_text(face = "bold"),
    legend.position = "none"
  )