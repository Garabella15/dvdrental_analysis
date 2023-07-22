SELECT 
        country, 
        COUNT(DISTINCT customer_id) AS customer_base
        
FROM {{ source('dvdrental_data', 'country')}}
JOIN {{ source('dvdrental_data', 'city')}}
USING(country_id)
JOIN {{ source('dvdrental_data', 'address')}}
USING(city_id)
JOIN {{ source('dvdrental_data', 'customer')}}
USING(address_id)
GROUP BY 1
ORDER BY 2 ASC
LIMIT 40