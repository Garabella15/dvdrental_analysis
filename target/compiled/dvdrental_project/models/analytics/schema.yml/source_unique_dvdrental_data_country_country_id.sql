
    
    

select
    country_id as unique_field,
    count(*) as n_records

from dvdrental.dvdrental.country
where country_id is not null
group by country_id
having count(*) > 1


