-- ===========================================================================================
-- 03_finding_users_who_purchased_and_their_total_events.sql 
-- Purpose: Separating users who completed part of the funnel (purchase) 
--          from those who did not purchase/complete the funnel
-- Input: events_cleaned table 
-- Output: Total events + info on purchase behavior 
-- ===========================================================================================

SELECT user_id,  COUNT( event_type) AS "total_number_of_events",
SUM(CASE WHEN event_type LIKE "%purchase%" THEN 1 ELSE 0 END) AS number_of_purchases
FROM events_cleaned
GROUP BY user_id

-- Optional: 
--  To check that the query is running as intended, a specfic user 
--  was singled out. This particular user had 12 total event types 
--  including 2 purchases + cart + views   
-- 
-- First finding that user's total event types: 
-- SELECT user_id, event_type, event_time   FROM events_cleaned  WHERE  user_id = 1515915625519356010
--
--
-- Now their total events with their purchases:
-- SELECT user_id,  COUNT( event_type) AS "total_number_of_events",
-- SUM(CASE WHEN event_type LIKE "%purchase%" THEN 1 ELSE 0 END) AS number_of_purchases  FROM events_cleaned
-- WHERE  user_id = 1515915625519356010  GROUP BY user_id
