# Write your MySQL query statement below
with order_by_turn as 
(
    select person_id, person_name , weight , turn, 
    sum(weight) over (order by turn)  as total_weight
    from Queue
) 
select person_name 
from order_by_turn
where turn = (
    select max(turn) 
    from order_by_turn
    where total_weight<= 1000
)