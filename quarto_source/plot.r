library(ggplot2)
library(tidyverse)

df <- data.frame(
  participant = c("Prediction only", "Prediction only", "Prediction only", "Prediction & Triage", "Prediction & Triage", "Prediction & Triage", "Prediction & Triage", "Triage only", "Triage only", "Triage only", "Triage only"),
  event = c("Recruitment", "Delivery", "Outcomes", "Recruitment", "Hypertension", "Delivery", "Outcomes", "Hypertension", "Recruitment", "Delivery", "Outcomes"),
  EGA = c(15,38,40,13,28,32,34,33,33.5,35,37)
)

df$participant <- factor(df$participant, levels = c("Triage only", "Prediction & Triage", "Prediction only"))
df$event <- factor(df$event, levels = c("Recruitment", "Hypertension", "Delivery", "Outcomes"))

df %>% ggplot(aes(EGA, participant)) +
  geom_line(aes(group = participant)) +
  geom_point(aes(color = event)) +
  scale_x_continuous(name = "Gestational age (weeks)", limits = c(0,40)) +
  scale_y_discrete(name = "Study eligibility") +
  geom_vline(xintercept = 16, linetype = "dashed", color = "red", size = 0.6) +
  labs(color = "Event") %>%
  saveRDS(file = "flow.rds")

