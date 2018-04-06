这题一看到便以为用 limit 1,1 可以解决，不想 Wrong Answer<br>
主要是缺少对记录不存在时的处理，耗时较长原因是一直以为 limit 1,1 无记录时也会返回NULL(Navicat表现是一样的，还是得到命令行客户端执行)，而事实是什么也查不出来<br>
原因找出来了，就好解决，CASE WHEN，IFNULL，UNION ALL两条NULL记录都行
```mysql
SELECT CASE WHEN (
    @Salary:=(SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 1,1)
) IS NULL THEN NULL ELSE CAST(@Salary AS DECIMAL) END AS SecondHighestSalary
;
```
```mysql
SELECT DISTINCT Salary AS SecondHighestSalary FROM Employee
UNION ALL
SELECT NULL
UNION ALL
SELECT NULL
ORDER BY SecondHighestSalary DESC
LIMIT 1,1
;
```