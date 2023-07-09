with rent_demand as (
select 
    c.name as genre,
    count(cs.customer_id) as total_rent_demand
from dvdrental.dvdrental.category as c
join dvdrental.dvdrental.film_category as fc
using(category_id)
join dvdrental.dvdrental.film as f 
using(film_id)
join dvdrental.dvdrental.inventory as i
using(film_id)
join dvdrental.dvdrental.rental as r
using(inventory_id)
join dvdrental.dvdrental.customer cs
using(customer_id)
group by 1
order BY 2 DESC)

select * from rent_demand