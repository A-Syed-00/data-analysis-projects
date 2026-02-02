-- ===========================================================================================
-- 05_creating_binary_flags.sql 
-- Purpose: Transform numeric counts into yes/no flags per user for each event type 
-- Input: events_cleaned table 
-- Output: events_flags table
-- Notes: This table will be used for funnel progression and visualization
-- ===========================================================================================
DROP TABLE IF EXISTS events_flags; 

CREATE TABLE events_flags AS
SELECT 
  user_id,
  MAX(CASE WHEN event_type LIKE "%purchase%" THEN 1 ELSE 0 END) AS  has_purchase,
  MAX(CASE WHEN event_type LIKE "%cart%" THEN 1 ELSE 0 END) AS has_carted,
  MAX(CASE WHEN event_type LIKE "%view%" THEN 1 ELSE 0 END) AS has_view
FROM events_cleaned
GROUP BY user_id; 

--Optional sanity check: 
-- SELECT * FROM events_flags WHERE user_id = 1515915625519356010;
