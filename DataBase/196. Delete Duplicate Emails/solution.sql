delete p1 from Person p1
inner join Person p2 on p1.Email=p2.Email
where p1.id>p2.id
;