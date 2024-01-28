# Write your MySQL query statement below
with filter as (
select 
    sum(CASE when order_date = customer_pref_delivery_date and rn = 1 then 1 else 0 END) as immediate,
    sum(CASE when order_date != customer_pref_delivery_date  and rn = 1 then 1 else 0 END) as scheduled
from (
select 
customer_id, delivery_id , order_date,customer_pref_delivery_date ,
row_number() over (partition by customer_id order by order_date)  as rn 
from  Delivery 
) as t2 

) 

select 
     round((immediate/(scheduled+immediate)*100),2) as immediate_percentage
     from filter
