with top_loyal_customers as (
SELECT first_name ||' '|| last_name AS full_name, email, address, phone, city, country, sum(amount) AS total_purchase
FROM {{ source('dvdrental_data', 'customer')}} as cs
JOIN {{ source('dvdrental_data', 'address')}} as  ad
ON cs.address_id = ad.address_id
JOIN {{ source('dvdrental_data', 'city')}} as ct
ON ad.city_id = ct.city_id
JOIN {{ source('dvdrental_data', 'country')}} as cy
ON ct.country_id = cy.country_id
JOIN {{ source('dvdrental_data', 'payment')}} as pm
ON cs.customer_id = pm.customer_id
GROUP BY 1, 2, 3, 4, 5, 6
),

final as (
select * from top_loyal_customers
ORDER BY total_purchase DESC
LIMIT 10
)

select * from final