select 
t1.id,
case when t1.id % 2 =1 then case when t2.student is null then t1.student else t2.student end else t3.student end student 
from seat t1
left join seat t2 on t1.id=t2.id-1
left join seat t3 on t1.id=t3.id+1
order by t1.id
;