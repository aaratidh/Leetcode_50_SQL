# Write your MySQL query statement below
select name  as results
from 
(
select u.name 
from Users u 
join  MovieRating mr
on u.user_id =  mr.user_id 
group by u.user_id 
order by count(mr.user_id) desc,u.name 
limit 1 
) as t1 
union  all
select title 
from 
(
select m.title, avg(rating) 
from movies m 
join MovieRating mr 
on mr.movie_id =m.movie_id
where created_at < '2020-03-01' and created_at > '2020-01-31'
group by mr.movie_id
order by avg(rating)  desc, m.title  
limit 1
) as t2

