
  
    

        create or replace transient table DVDRENTAL_DEV.DEV.top_loyal_customers
         as
        (with top_loyal_customers as (
SELECT first_name ||' '|| last_name AS full_name, email, address, phone, city, country, sum(amount) AS total_purchase
FROM dvdrental.dvdrental.customer as cs
JOIN dvdrental.dvdrental.address as  ad
ON cs.address_id = ad.address_id
JOIN dvdrental.dvdrental.city as ct
ON ad.city_id = ct.city_id
JOIN dvdrental.dvdrental.country as cy
ON ct.country_id = cy.country_id
JOIN dvdrental.dvdrental.payment as pm
ON cs.customer_id = pm.customer_id
GROUP BY 1, 2, 3, 4, 5, 6
),

final as (
select * from top_loyal_customers
ORDER BY total_purchase DESC
LIMIT 10
)

select * from final
        );
      
  