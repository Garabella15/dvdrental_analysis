select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select address_id
from dvdrental.dvdrental.address
where address_id is null



      
    ) dbt_internal_test