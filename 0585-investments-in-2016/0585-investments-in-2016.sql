# Write your MySQL query statement below
with adress as (
   select  concat(lat, lon) as address 
        from insurance 
        group by address 
        Having count(*)=1
),
    employee as 
    (
    select I1.pid 
             from insurance I1 
            Join insurance I2
            on I1.pid != I2.pid 
            where I1.tiv_2015 = I2.tiv_2015
            group by I1.pid 
    )
    
    select round(sum(i.tiv_2016),2) as tiv_2016
    from employee e 
    left join insurance i 
    on e.pid = i.pid 
    where concat(i.lat , i.lon) in (select * from adress)
    
    


  




