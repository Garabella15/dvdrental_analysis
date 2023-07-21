
    
    

select
    address_id as unique_field,
    count(*) as n_records

from dvdrental.dvdrental.address
where address_id is not null
group by address_id
having count(*) > 1


