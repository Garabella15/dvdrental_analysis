
    
    

select
    payment_id as unique_field,
    count(*) as n_records

from dvdrental.dvdrental.payment
where payment_id is not null
group by payment_id
having count(*) > 1


