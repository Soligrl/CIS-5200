
-- 1. Create Hive external table
CREATE EXTERNAL TABLE sruiz85_redfin_state (
  period_begin STRING,
  period_end STRING,
  period_duration STRING,
  region_type STRING,
  region_type_id STRING,
  table_id STRING,
  is_seasonally_adjusted STRING,
  region STRING,
  city STRING,
  state STRING,
  state_code STRING,
  property_type STRING,
  property_type_id STRING,
  median_sale_price DOUBLE,
  median_sale_price_mom DOUBLE,
  median_sale_price_yoy DOUBLE,
  median_list_price DOUBLE,
  median_list_price_mom DOUBLE,
  median_list_price_yoy DOUBLE,
  median_ppsf DOUBLE,
  median_ppsf_mom DOUBLE,
  median_ppsf_yoy DOUBLE,
  median_list_ppsf DOUBLE,
  median_list_ppsf_mom DOUBLE,
  median_list_ppsf_yoy DOUBLE,
  homes_sold INT,
  homes_sold_mom DOUBLE,
  homes_sold_yoy DOUBLE,
  pending_sales INT,
  pending_sales_mom DOUBLE,
  pending_sales_yoy DOUBLE,
  new_listings INT,
  new_listings_mom DOUBLE,
  new_listings_yoy DOUBLE,
  inventory INT,
  inventory_mom DOUBLE,
  inventory_yoy DOUBLE,
  months_of_supply DOUBLE,
  months_of_supply_mom DOUBLE,
  months_of_supply_yoy DOUBLE,
  median_dom INT,
  median_dom_mom DOUBLE,
  median_dom_yoy DOUBLE,
  avg_sale_to_list DOUBLE,
  avg_sale_to_list_mom DOUBLE,
  avg_sale_to_list_yoy DOUBLE,
  sold_above_list INT,
  sold_above_list_mom DOUBLE,
  sold_above_list_yoy DOUBLE,
  price_drops INT,
  price_drops_mom DOUBLE,
  price_drops_yoy DOUBLE,
  off_market_in_two_weeks DOUBLE,
  off_market_in_two_weeks_mom DOUBLE,
  off_market_in_two_weeks_yoy DOUBLE,
  parent_metro_region STRING,
  parent_metro_region_metro_code STRING,
  last_updated STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/sruiz85/my_state_data'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- 2. Chart 1: Line Chart (Yearly Average Median List Price by State)
SELECT state, YEAR(TO_DATE(period_begin)) AS year, 
       AVG(median_list_price) AS avg_list_price
FROM sruiz85_redfin_state
WHERE median_list_price IS NOT NULL
GROUP BY state, YEAR(TO_DATE(period_begin));

-- 3. Chart 2: Map (Average Median List Price by State in 2021)
SELECT state, AVG(median_list_price) AS avg_list_price
FROM sruiz85_redfin_state
WHERE YEAR(TO_DATE(period_begin)) = 2021
  AND median_list_price IS NOT NULL
GROUP BY state;

-- 4. Chart 3: Heatmap (Volatility by State and Year)
SELECT state, YEAR(TO_DATE(period_begin)) AS year, 
       STDDEV(median_list_price) AS volatility
FROM sruiz85_redfin_state
WHERE median_list_price IS NOT NULL
GROUP BY state, YEAR(TO_DATE(period_begin))
ORDER BY state, year;

-- 5. Chart 4: Bar Chart (Top 10 States by Price Growth)
SELECT
  state,
  MAX(CASE WHEN YEAR(TO_DATE(period_begin)) = 2012 THEN median_list_price END) AS start_price,
  MAX(CASE WHEN YEAR(TO_DATE(period_begin)) = 2021 THEN median_list_price END) AS end_price,
  ROUND(100 * (
    MAX(CASE WHEN YEAR(TO_DATE(period_begin)) = 2021 THEN median_list_price END) -
    MAX(CASE WHEN YEAR(TO_DATE(period_begin)) = 2012 THEN median_list_price END)
  ) /
    MAX(CASE WHEN YEAR(TO_DATE(period_begin)) = 2012 THEN median_list_price END), 2) AS percent_growth
FROM sruiz85_redfin_state
WHERE median_list_price IS NOT NULL
GROUP BY state
ORDER BY percent_growth DESC
LIMIT 10;
