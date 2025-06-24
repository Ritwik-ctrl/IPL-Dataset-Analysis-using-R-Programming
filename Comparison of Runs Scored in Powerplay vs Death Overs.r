library(dplyr)
library(ggplot2)

comparison <- data.frame(
  Over_Type = c("Powerplay", "Death Overs"),
  Total_Runs = c(
    deliveries %>% 
      filter(over >= 1 & over <= 6) %>% 
      mutate(total = batsman_runs + extra_runs) %>% 
      summarise(sum(total, na.rm = TRUE)) %>% pull(),
    
    deliveries %>% 
      filter(over >= 16 & over <= 20) %>% 
      mutate(total = batsman_runs + extra_runs) %>% 
      summarise(sum(total, na.rm = TRUE)) %>% pull()
  )
)

ggplot(comparison, aes(x = Over_Type, y = Total_Runs, fill = Over_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  geom_text(aes(label = Total_Runs), vjust = -0.5, size = 5, fontface = "bold") +
  labs(
    title = "Comparison of Runs Scored in Powerplay vs Death Overs",
    x = "Over Type",
    y = "Total Runs"
  ) +
  theme_minimal(base_size = 14)