select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select inventory_id
from dvdrental.dvdrental.inventory
where inventory_id is null



      
    ) dbt_internal_test