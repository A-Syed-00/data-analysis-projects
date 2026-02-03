# ============================================================================================================
# 01_funnel_proportion_analysis.R 
# Inputs: 
#        - funnel_progression.csv 
#        - stalled_users_funnel.csv
#        - events_flags.csv 
# Outputs: 
#        - Funnel Progression bar plot 
#        - Stalled users horizontal bar plot 
#        - Percentage of users within each event type 
# =============================================================================================================

# Load libraries 
library(tidyverse)

# ----------------------------
# 1. Load personal datasets 
# ----------------------------
setwd("~/Downloads/Project Files") # adjust file path as needed 

events_funnel <- read.csv("funnel_progression.csv")
users_stalled <- read.csv("stalled_users_funnel.csv")
events_flags <- read.csv("events_flags.csv")

glimpse(events_funnel)

# -----------------------------------
# 2. Funnel progression percentages
# -----------------------------------
view_to_cart <- round(events_funnel$users_view_cart/ events_funnel$users_viewed * 100, 2)
cart_to_purchase <- round(events_funnel$users_cart_purchase/ events_funnel$users_view_cart * 100, 2)
view_to_purchase <- round(events_funnel$users_view_purchase/ events_funnel$users_viewed * 100, 2)
complete_funnel <- round(events_funnel$users_complete_stages/ events_funnel$users_viewed * 100, 2)


funnel_graph <- tibble( 
  stage = c("View → Cart", "Cart → Purchase", "View → Purchase", "Complete Funnel"),
  percentage = c(view_to_cart, cart_to_purchase, view_to_purchase, complete_funnel 
  )
)

# Funnel prgression bar plot 
ggplot(funnel_graph, aes(x=stage, y=percentage)) + geom_col(fill="steelblue") + geom_text(aes(label=round(percentage,1)), vjust=-0.5) + ylim(0,100) +
  labs(title="User Funnel Progression", y= "Percentage (%)",  x="Funnel Stage") +
  theme_minimal()

# ----------------------------------
# 3. Stalled users proportions 
# ----------------------------------

# Total users who added to cart (for denominator) 
users_cart <- sum(events_flags$has_carted == 1)

stall_view <- round(users_stalled$only_viewed / events_funnel$users_viewed * 100, 2)
stall_cart <- round(users_stalled$cart_no_purchase / users_cart * 100, 2)


stalled_users_graph <- tibble( 
  stage = c("Stalled at View", "Stalled at Cart"), 
  percentage = c(stall_view, stall_cart))

# Stalled users horizontal bar plot 
ggplot(stalled_users_graph, aes(x=percentage, y=stage)) + 
  geom_col(fill="aquamarine1") + geom_text (
    
    aes(label = paste0(round(percentage, 1), "%")),
    hjust = -0.1,
    size = 4
  ) +
  labs(
    title = "Where Users are Stalling",
    x = "Percentage of Users",
    y = ""
 ) + theme_minimal()

# --------------------------------------
# 4. Percentage of users per event type 
# ---------------------------------------

total_users <- nrow(events_flags)
events_summary <- tibble (
  stage = c("Viewed", "Added to Cart", "Purchased"), 
  users = c(
    sum(events_flags$has_view == 1), 
    sum(events_flags$has_carted == 1), 
    sum(events_flags$has_purchase == 1)
  ) )


percentage <- round(users / total_users*100,2)

# Event type percentage bar plot 
ggplot (events_summary, aes(x=stage, y=percentage)) + geom_col(fill='orange') + 
  geom_text(aes(label = paste0(percentage, "%")), 
            vjust = -0.5, size = 4) +
  ylim(0, 100) +
  labs(
    title = "Percentage of Users Reaching Each Funnel Stage",
    x = "Funnel Stage",
    y = "Percentage of Users"
  ) +
  theme_minimal()
