library(dplyr)
library(ggplot2)
boundary_probability <- deliveries %>%
  mutate(is_boundary = ifelse(batsman_runs %in% c(4, 6), 1, 0)) %>%
  group_by(over) %>%
  summarise(probability_of_boundary = mean(is_boundary, na.rm = TRUE))
ggplot(boundary_probability, aes(x = over, y = probability_of_boundary)) +
  geom_line(color = "blue") +
  geom_point(color = "red"
             , size = 3) +
  labs(title = "Probability of Scoring a Boundary in Each Over"
       , x = "Over"
       , y = "Probability of Boundary") +
  theme_minimal()