select distinct num as consecutiveNums
From (
    select 
         num,
         LEAD(num) Over (order by id) as b4 ,
         Lag(num) Over (order by id) as after 
         From Logs 
) as t2
Where 
     b4 = num  and
     num = after