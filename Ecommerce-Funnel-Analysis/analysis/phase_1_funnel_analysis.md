# E-commerce Funnel Analysis - Phase 1 

## Project Overview
This project examined user-level event history data collected from an online electronics store. The primary objective of phase 1 was to analyze the user conversion funnel by tracking how users move through 
event types: view, cart, and purchase. The analysis also focused on identifying where users drop off from to progressing to subsequent funnel stages. SQL (SQLite) was used for data transformation and aggregation 
while R was used for analysis and visualization. 

## Business Objectives 
The analysis focuses on the following questions: 

1. How many users reach each stage of the e-commerce funnel?
2. What proportion of users progress from view → cart → purchase?
3. Where do users stall or drop off most frequently in the funnel?
4. What percentage of users ultimately complete a purchase?

## Data Understanding 

### Unit of Analysis 
In the raw dataset, each row represents a single user interaction with a product at a specfic time. The primary level of analysis for phase 1 focuses on user-level behavior (all events that a single user experiences across all sessions) 
rather than session-level behavior (events a user completes during a single website session). To align with this objective, certain variables were selected from the original dataset for analysis. 

### Key Variables 
 - `user_id` : Numeric unique identifier for each user
 - `event_type`: Type of interaction (`view`, `cart`, `purchase`)
 - `product_id`: Identifier for the product interacted with
 - 'event_time`: Time that the event occured (timestamp in this format YYYY-MM-DD HH:MM:SS UTC)

### Funnel Logic 
Each funnel stage is defined by the following event types: 
 - **View** → indicates interest
 - **Cart** → indicates purchase intent
 - **Purchase** → indicates conversion
For this analysis, a user is considered to have completed the funnel if they made at least one purchase, even if intermediate steps were skipped.

### Data Cleaning & Assumptions 

 - Rows were required to have values for `user_id`, `product_id`, and `event_type` to be included for analysis.
 - Rows with missing `user_session` values were retained since analysis focuses on events at user-level.
 - Raw data and some intermediate tables are excluded from the repository due to file size constraints.
 - All steps are reproduable using the SQL scripts in the `/sql` directory.


## Methodology 

### SQL Transformations
SQL was used to: 
 - Clean and filter event-level data
 - Aggregate user activity across the event types
 - Create binary flags (yes/no) for users reaching a funnel stage
 - Generate summary tables for funnel progression and stalled users.

### R Propotion Analysis and Visualizations 

### Funnel Definitions

The intermediate tables `events_flags` and `


## Key Results 

### Funnel Counts 
This section summarizes how many users reached each funnel stage. 
(Reference for Funnel counts → `funnel_progression.csv`) 
    

Event Type Counts: 
 - Total users who viewed products: 406,863
 - Total users who added items to cart: 36,952
 - Total users who purchased: 21,304
   

Funnel Counts 
  - Total users who viewed products: 406,863
  - Total users who viewed and added to cart: 36,950
  - Total users who added to cart and purchased: 20,056
  - Total users who viewed and purchased: 20,884
  - Total users who completed the funnel: 20,054



