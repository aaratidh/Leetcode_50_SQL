Select 
  Case 
      when mod(id,2) = 0 then id-1 
      when id = (select count(*) from seat) then  id 
      else id +1
  END AS id, 
      student 
 from seat 
 order by id 