library(ggplot2)
library(dplyr)
deliveries %>%
  group_by(batter) %>%
  summarise(
    total_runs = sum(batsman_runs, na.rm = TRUE),
    total_balls = n(),
    .groups = 'drop'
  ) %>%
  mutate(strike_rate = (total_runs / total_balls) * 100) %>%
  ggplot(aes(x = total_balls, y = strike_rate)) +
  geom_point(color = "darkred") +
  geom_smooth(method = "lm"
              , color = "blue"
              , se = FALSE) +
  labs(title = "Batter Strike Rate vs Balls Faced"
       , x = "Balls Faced"
       , y = "Strike Rate") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))