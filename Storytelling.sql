USE Airbnb_Analysis;
-- Which neighborhoods have the most listings? 
-- And does this affect prices?"
SELECT TOP 5 neighbourhood_cleansed, COUNT(id) AS listing_count,
ROUND(AVG(price),2) AS avg_price
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY listing_count DESC;

-- Questions about prices?
-- WHAT IS THE AVERAGE PRICE?
SELECT ROUND(AVG(price), 2) AS avg_price
FROM cleaned_airbnb_data;

-- Which properties have a price above the average?
SELECT * 
FROM cleaned_airbnb_data
WHERE price > (SELECT AVG(price) FROM cleaned_airbnb_data);

-- What is the highest and lowest listing price?
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM cleaned_airbnb_data;

-- What is the average price for every neighbourhood?
SELECT neighbourhood_cleansed, ROUND(AVG(price), 2) AS avg_price
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY avg_price DESC;

-- Questions about neighbourhoods 
-- Which neighborhoods are the most active based on
--the number of reviews?
SELECT neighbourhood_cleansed, SUM(number_of_reviews) AS total_reviews
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY total_reviews DESC;

-- How many properties are in every Neighborhoods?
SELECT neighbourhood_cleansed, COUNT(*) AS total_properties
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY total_properties DESC;

-- Questions about Property types and room categories
-- Which type of room is most commonly listed?
SELECT room_type, COUNT(*) AS total
FROM cleaned_airbnb_data
GROUP BY room_type
ORDER BY total DESC;

-- what is the average price for every room type?
SELECT room_type, ROUND(AVG(price),2) AS avg_price
FROM cleaned_airbnb_data
GROUP BY room_type
ORDER BY avg_price DESC;

-- How many rooms are suitable for more than 4 people?
SELECT COUNT(*) AS total_large_rooms
FROM cleaned_airbnb_data
WHERE accommodates > 4;

-- What is the average overall rating for all listings?
SELECT ROUND(AVG(review_scores_rating),2) AS avg_rating
FROM cleaned_airbnb_data
WHERE review_scores_rating IS NOT NULL;

-- Which properties have an overall rating score below 80?
SELECT id, review_scores_rating
FROM cleaned_airbnb_data
WHERE review_scores_rating < 80;

-- How many properties are without reviews?
SELECT COUNT(*) AS properties_without_reviews
FROM cleaned_airbnb_data
WHERE number_of_reviews = 0;

-- how many properties are available all year?
SELECT COUNT(*) AS always_available
FROM cleaned_airbnb_data
WHERE availability_365 = 365;

-- which neighborhoods have properties that are available all year?
-- and knowing which are the most famous
SELECT neighbourhood_cleansed AS Neighborhood,
COUNT(*) AS always_available
FROM cleaned_airbnb_data
WHERE availability_365 = 365
GROUP BY neighbourhood_cleansed
ORDER BY always_available;

--How many properties haven’t been booked recently? (more than 180 without reviews)
SELECT COUNT(*) AS inactive_properties
FROM cleaned_airbnb_data
WHERE days_since_last_review > 180;

-- How many hosts are verified?  1 = t (True) (verified)
SELECT COUNT(DISTINCT host_id) AS verified_hosts
FROM cleaned_airbnb_data
WHERE host_identity_verified = 1;

-- Which hosts own more than 10 listings?
SELECT host_id, host_listings_count
FROM cleaned_airbnb_data
WHERE host_listings_count > 10
GROUP BY host_id, host_listings_count
ORDER BY host_listings_count DESC;

-- Is there any relationship between listing price 
-- and the number of reviews
SELECT price, number_of_reviews
FROM cleaned_airbnb_data
WHERE number_of_reviews IS NOT NULL
ORDER BY price;

--Do highly rated properties tend to receive more reviews?
SELECT TOP 5 review_scores_rating, number_of_reviews
FROM cleaned_airbnb_data
WHERE review_scores_rating IS NOT NULL;

-- Identify the neighborhoods with the highest number of properties
SELECT neighbourhood_cleansed, COUNT(id) AS total_listings
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY total_listings DESC;

-- Is there a relationship between 
--the number of properties and the rental price?
SELECT TOP 10 neighbourhood_cleansed, 
COUNT(id) AS total_listings, ROUND(AVG(price),2) AS avg_price
FROM cleaned_airbnb_data
GROUP BY neighbourhood_cleansed
ORDER BY total_listings DESC;



