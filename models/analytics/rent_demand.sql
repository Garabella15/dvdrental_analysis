with rent_demand as (
select 
    c.name as genre,
    count(cs.customer_id) as total_rent_demand
from {{ source('dvdrental_data', 'category')}} as c
join {{ source('dvdrental_data', 'film_category')}} as fc
using(category_id)
join {{ source('dvdrental_data', 'film')}} as f 
using(film_id)
join {{ source('dvdrental_data', 'inventory')}} as i
using(film_id)
join {{ source('dvdrental_data', 'rental')}} as r
using(inventory_id)
join {{ source('dvdrental_data', 'customer')}} cs
using(customer_id)
group by 1
order BY 2 DESC)

select * from rent_demand