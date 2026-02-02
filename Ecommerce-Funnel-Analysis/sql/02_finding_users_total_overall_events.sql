-- ===========================================================================================
-- 02_finding_users_total_overall_events.sql 
-- Purpose: Get baseline numbers for user engagement        
-- Input: events_cleaned table 
-- Output: Total number of actions (view, cart, purchase) per user
-- Notes: This table is for exploration
-- ===========================================================================================
DROP TABLE IF EXISTS user_total_events; 

CREATE TABLE user_total_events AS 
SELECT 
  user_id,  
  COUNT(event_type) AS total_number_of_events
FROM events_cleaned
GROUP BY user_id; 
