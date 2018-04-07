要查出每个department前3大salary的Employee信息<br>
第一反应是想用limit来查出前3大，但是limit不允许在子查询中使用，pass<br>
想不出其他办法，只能用了用户变量<br>
定义了3个变量：@count 用来筛选前3大Salary，@preDepartment 记录前一条记录的department, @preSalary 记录前一条记录的salary<br>
这里需要注意的是前3大Salary的Employee信息并不是只有3条，可能存在重复的Salary,所以需要有@preSalary这个变量，根据这个变量的值来决定是否更新@count<br>
用了用户变量，太复杂，思想还是不够开拓

简便的解法
----------
首先，要查找出salary前3大的Employee信息，可以用以下sql<br>
```mysql
select e1.Name as 'Employee', e1.Salary
from Employee e1
where 3 >
(
    select count(distinct e2.Salary)
    from Employee e2
    where e2.Salary > e1.Salary
)
;
```

其次，要统计每个department的，只要在统计维度上加上DepartmentId<br>
```mysql
select b.name Department,a.name Employee,a.Salary
from Employee a
inner join Department b on a.DepartmentId =b.id
where 3 > (
    select count(distinct c.Salary)
    from Employee c
    where c.salary > a.salary and c.DepartmentId=a.DepartmentId
)
;
```

count(distinct ...)自己平时较为少用，可以关注<br>
要查询出前几的数据，不一定要排序，limit;也可以统计比当前记录大的记录数来得出<br>