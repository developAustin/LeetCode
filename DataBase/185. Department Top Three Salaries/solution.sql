select e.name Department,d.name Employee,d.salary
from Employee d
inner join Department e on d.DepartmentId=e.id
where d.id in (
    select c.id from (
select if(@preDepartment=a.DepartmentId,if(@preSalary=a.Salary,@count,@count:=@count+1),@count:=1),if(@count <=3,a.id,null) id,@preDepartment:=a.DepartmentId,@preSalary:=a.Salary
from (select id,Salary,DepartmentId from Employee order by DepartmentId asc,Salary desc) a,(select @preSalary:=null,@count:=0,@preDepartment:=null) b
    ) c where c.id is not null
)
;