# Write your MySQL query statement below
with count_dist as  
(
select customer_id , count(distinct c.product_key)  as count1
from customer c 
join product pk
on pk.product_key = c.product_key
group by c.customer_id
) 
 
select customer_id 
from  count_dist 
where count1 = (select count(*) from product)


 