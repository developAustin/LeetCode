select name Customers 
from customers a
where not exists (select 1 from orders b where a.id=b.CustomerId)
;