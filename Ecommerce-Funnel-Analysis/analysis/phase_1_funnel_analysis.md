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
 - `event_type`: Type of interaction (`view`, `cart', `purchase`)
 - `product_id`: Identifier for the product interacted with
 - 'event_time`: Time that the event occured (timestamp in this format YYYY-MM-DD HH:MM:SS UTC)

### Funnel Logic 
Each funnel stage is defined by the following event types: 
 - **View** → indicates interest
 - **Cart** → indicates purchase intent
 - **Purchase** → indicates conversion
For this analysis, a user is considered to have completed the funnel if they made at least one purchase, even if intermediate steps were skipped.

### Data Cleaning & Assumptions 


