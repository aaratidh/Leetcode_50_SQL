# Write your MySQL query statement below
select  s.product_id, s.year as first_year, s.quantity, s.price
from Sales s 
where (s.year, product_id) in (
 select min(year)  , product_id
 from Sales 
 group by product_id
 
)
