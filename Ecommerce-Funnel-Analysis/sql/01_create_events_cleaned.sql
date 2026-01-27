-- ===========================================================================================
-- 01_create_events_cleaned.sql 
-- Purpose: Create a cleaned version of the raw events table 
--          while keeping the essential columns for analysis
-- Input: events (raw event table) 
-- Output: events_cleaned(analysis-ready table) 
-- Assumptions: 
--             - user_id, product_id, and event_type must be present for row to be meaningful 
--             - user_session and event_time can be NULL at this stage
-- ===========================================================================================

-- Create cleaned table 
CREATE TABLE events_cleaned  AS
SELECT event_time, user_id, product_id, user_session, event_type
FROM events_raw

--Optional
-- Check for null values: 
-- SELECT
--SUM(CASE WHEN event_time IS NULL THEN 1 ELSE 0 END )AS missing_time,
--SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS missing_user,
--SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product,
--SUM(CASE WHEN user_session IS NULL THEN 1 ELSE 0 END) AS missing_session,
--SUM(CASE WHEN event_type IS NULL THEN 1 ELSE 0 END) AS missing_event
--FROM events_raw
--
--
-- verify/check rows + count 
-- SELECT COUNT(*) FROM events_cleaned

