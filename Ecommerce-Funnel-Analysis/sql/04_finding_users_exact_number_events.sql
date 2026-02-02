-- ===========================================================================================
-- 04_finding_users_exact_number_events.sql 
-- Purpose: Breaking down user activity by event_type: view, cart, purchase
-- Output: Counts for each event type per user
-- ===========================================================================================

SELECT user_id, COUNT(event_type) AS total_number_events,
SUM(CASE WHEN event_type LIKE "%purchase%" THEN 1 ELSE 0 END) AS number_of_purchases,
SUM(CASE WHEN event_type LIKE "%cart%" THEN 1 ELSE 0 END) AS number_of_cart,
SUM(CASE WHEN event_type LIKE "%view%" THEN 1 ELSE 0 END) AS number_of_views
FROM events_cleaned
GROUP BY user_id

--Optional: Sanity check 
-- Add WHERE statement along with a particular user_id to check if counts are accurate: 
-- WHERE user_id = 1515915625519356010
