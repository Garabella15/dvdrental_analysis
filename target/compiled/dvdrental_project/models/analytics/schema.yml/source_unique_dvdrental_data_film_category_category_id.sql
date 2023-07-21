
    
    

select
    category_id as unique_field,
    count(*) as n_records

from dvdrental.dvdrental.film_category
where category_id is not null
group by category_id
having count(*) > 1


