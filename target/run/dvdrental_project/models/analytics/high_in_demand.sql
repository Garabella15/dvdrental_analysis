
  
    

        create or replace transient table DVDRENTAL_DEV.DEV.high_in_demand
         as
        (SELECT 
        country, 
        COUNT(DISTINCT customer_id) AS customer_base,
        SUM(amount) AS total_sales
FROM dvdrental.dvdrental.country
JOIN dvdrental.dvdrental.city
USING(country_id)
JOIN dvdrental.dvdrental.address
USING(city_id)
JOIN dvdrental.dvdrental.customer
USING(address_id)
JOIN dvdrental.dvdrental.payment
USING(customer_id)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 15
        );
      
  