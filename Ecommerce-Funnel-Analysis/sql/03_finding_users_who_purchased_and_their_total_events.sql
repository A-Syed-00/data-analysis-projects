-- ===========================================================================================
-- 03_finding_users_who_purchased_and_their_total_events.sql 
-- Purpose: Create a table with total events and number of purchases
-- Input: events_cleaned table 
-- Output: user_purchase_counts table 
-- Notes: Useful for funnel analysis and identifying engaged users
-- ===========================================================================================
DROP TABLE IF EXISTS user_purchase-counts; 

CREATE TABLE user_purchase_counts AS 
SELECT 
  user_id,  
  COUNT(event_type) AS total_number_of_events,
  SUM(CASE WHEN event_type LIKE "%purchase%" THEN 1 ELSE 0 END) AS number_of_purchases
FROM events_cleaned
GROUP BY user_id;

-- Optional: sanity check:  
-- SELECT * FROM user_purchase_counts WHERE  user_id = 1515915625519356010
