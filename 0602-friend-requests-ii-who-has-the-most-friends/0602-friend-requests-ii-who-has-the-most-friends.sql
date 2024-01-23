# Write your MySQL query statement below
with friend_num as 
       (
       select  requester_id id 
        from RequestAccepted 
        
    union all
       select  accepter_id id 
        from RequestAccepted

        )
    
select  id, count(*) NUM 
from friend_num
 group by id 
 ORDER BY  Num  desc 
 limit 1
    