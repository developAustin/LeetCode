select t2.Request_at Day,ROUND(case when t1.cancelNum/t2.total is null then 0.00 else t1.cancelNum/t2.total end,2) 'Cancellation Rate' from (
    select count(1) cancelNum,a.Request_at from Trips  a where a.status!='completed' and exists (select 1 from Users where role='client' and  Banned ='No' and users_id=a.Client_Id) group by a.Request_at
) t1
right join (select count(1) total,Request_at from Trips  where Client_Id  in (select Users_Id  from Users  where Banned ='No') group by Request_at) t2 on t1.Request_at=t2.Request_at
where t2.Request_at between '2013-10-01' and '2013-10-03'
;