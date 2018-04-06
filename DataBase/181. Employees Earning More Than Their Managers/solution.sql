select a.Name Employee 
from Employee a,
Employee b
where a.managerId=b.id and a.Salary > b.Salary
;