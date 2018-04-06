select c.name as Department,b.name as Employee,a.Salary
from(
    select  max(Salary) as Salary,DepartmentId
from Employee
group by DepartmentId 
) a
inner join Employee b on a.Salary=b.Salary and a.DepartmentId=b.DepartmentId
inner join Department c on b.DepartmentId=c.id
;