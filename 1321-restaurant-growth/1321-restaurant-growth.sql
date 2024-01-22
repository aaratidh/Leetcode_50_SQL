# Write your MySQL query statement below
with customer_copy as(

select c.visited_on , sum(c.amount) as amount  
from customer c
group by c.visited_on

)

select  c1.visited_on, 
Round (sum(c.amount), 2) as amount,
Round (avg(c.amount),2)   AS average_amount
from  customer_copy  c
join  customer_copy c1 
ON c1.visited_on  >= c.visited_on 
where datediff(c1.visited_on , c.visited_on) Between 0 and 6 
group by c1.visited_on
Having count(*)> 6 
