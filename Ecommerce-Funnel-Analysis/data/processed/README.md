# Processed Data 

This folder contains analysis-ready datasets derived from the raw  e-commerce event data using SQL transformations. 

Due to file constraints, raw data and large intermediate tables (e.g `events_cleaned`) are not included in the repository. 
All intermediate datasets can be recreated by executing the SQL scripts in the `/sql` directory. 

## Data Lineage 
The data processing pipeline follows the sequence below: 

Raw events data (not included due to size) 
→ 'events_cleaned' (not included due to size, reproduceable via SQL) 
→ 'events_flags.csv' 
→ 'funnel_progression.csv'
→ 'stalled_users_funnel.csv'
→ R Visualizations and proportions analysis

## File Descriptions 
`events_flags.csv`
User-level dataset indicating whether each user viewed, added to cart, or purchased at least one product 

`funnel_progression.csv`
Aggregated funnel metrics used to analyze user progression through view → cart → purchase stages

`stalled_users_funnel.csv`
Summary dataset identifying users who stalled at specific funnel stages (such as view-only, cart-no-purchase) 

