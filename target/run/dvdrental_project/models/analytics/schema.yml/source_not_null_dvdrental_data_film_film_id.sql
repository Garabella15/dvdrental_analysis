select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select film_id
from dvdrental.dvdrental.film
where film_id is null



      
    ) dbt_internal_test