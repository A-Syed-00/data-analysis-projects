-- ===========================================================================================
-- 06_funnel_progression.sql
-- Purpose: Create a table with user counts at each stage of the funnel
-- Input: events_flags table 
-- Output: funnel_progression table 
-- Notes: This table provides high-level funnel metrics for analysis and visualization
-- ===========================================================================================
DROP TABLE IF EXISTS funnel_progression;  
  
CREATE TABLE funnel_progression AS 
SELECT 
     SUM(CASE WHEN has_view = 1 THEN 1 ELSE 0 END) AS users_viewed,
     SUM(CASE WHEN has_view = 1 AND has_carted = 1 THEN 1 ELSE 0 END) AS users_view_cart,
     SUM(CASE WHEN has_carted = 1 AND has_purchase = 1 THEN 1 ELSE 0 END) AS users_cart_purchase, 
     SUM(CASE WHEN has_view = 1 AND has_purchase = 1 THEN 1 ELSE 0 END) AS users_view_purchase, 
     SUM(CASE WHEN has_view = 1 AND has_carted = 1 AND has_purchase = 1 THEN 1 ELSE 0 END) AS users_complete_stages
FROM events_flags;
