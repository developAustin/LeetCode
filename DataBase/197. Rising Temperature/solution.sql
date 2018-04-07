select a.id
from Weather a
inner join Weather b on date_add(b.date,interval 1 day)=a.date
where a.Temperature>b.Temperature
;