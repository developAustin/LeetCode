这题是176题的扩展，解决办法也可以借鉴，注意的是mysql函数变量的使用<br>
discusss看到另外一种思路
```mysql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
	RETURN (
		SELECT IF(COUNT(1)<N,NULL,MIN(Salary)) AS nThHighestSalary
		FROM (
		SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 0,N
		) TEMP
	);
END
```