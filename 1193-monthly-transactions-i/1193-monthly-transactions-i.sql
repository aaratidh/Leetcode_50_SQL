# Write your MySQL query statement below
with filtered as (

select 
date_format(trans_date, '%Y-%m') as month,
 t.country ,
count(*)  as trans_count, 
sum(if(t.state= "approved",1,0)) as approved_count,
sum(t.amount) as trans_total_amount,
sum(if( t.state= "approved",t.amount , 0)) as approved_total_amount
from Transactions  t
group by date_format(trans_date, '%Y-%m') , t.country
)


 select * from  filtered