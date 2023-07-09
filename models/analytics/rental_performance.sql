with daily_retal_date_check as(
select 
    *, 
    DATEDIFF(day, return_date::date, rental_date::date) as date_difference
from {{ source('dvdrental_data', 'rental')}}),

rental_performance as (
    select f.film_id,
      case 
          when rental_duration > date_difference then 'Returned early'
          when rental_duration = date_difference then 'Returned on time'
          else 'Returned late'
      end as return_status
      from {{ source('dvdrental_data', 'film')}} as f
      join {{ source('dvdrental_data', 'inventory')}} as i
      using(film_id)
      join daily_retal_date_check
      using(inventory_id)), 
      
final as (
select return_status, count(film_id) total_films
from rental_performance
group by 1)

select * from final