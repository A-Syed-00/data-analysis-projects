-- ===========================================================================================
-- 07_stalled_users_funnel.sql  
-- Purpose: Create a table to identify who stalled at view and cart stages of the funnel
-- Input: events_flags table 
-- Output: stalled_users_funnel table 
-- Notes: This table would provide insights for potential drop-off points in user engagement 
-- ===========================================================================================

DROP TABLE IF EXISTS stalled_users_funnel; 
CREATE TABLE stalled_users_funnel AS
SELECT
    SUM(CASE WHEN has_view = 1 AND has_carted = 0 AND has_purchase = 0 THEN 1 ELSE 0 END) AS only_viewed,
    SUM(CASE WHEN has_carted = 1 AND has_purchase = 0 THEN 1 ELSE 0 END) AS cart_no_purchase
FROM events_flags; 
