SELECT 
        country, 
        COUNT(DISTINCT customer_id) AS customer_base
        
FROM dvdrental.dvdrental.country
JOIN dvdrental.dvdrental.city
USING(country_id)
JOIN dvdrental.dvdrental.address
USING(city_id)
JOIN dvdrental.dvdrental.customer
USING(address_id)
GROUP BY 1
ORDER BY 2 ASC
LIMIT 40