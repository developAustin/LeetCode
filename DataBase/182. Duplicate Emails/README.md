简单题

有趣的解法
-----------

```mysql
SELECT DISTINCT a.Email FROM Person a
 LEFT JOIN (SELECT Id, Email from Person GROUP BY Email) b
 ON (a.email = b.email) AND (a.Id = b.Id)
 WHERE b.Email IS NULL
```

首先用子查询查出不重复的每一条记录，倘若原表不重复，那么原表与子查询必然可以关联，倘若有重复，那么至少有一条记录在子查询中找不到
------------------
```mysql
SELECT DISTINCT a.Email
FROM Person a
WHERE EXISTS(
   SELECT 1
   FROM Person b
   WHERE a.Email = b.Email
   LIMIT 1, 1
)
```

也可以用limit 1,1来查询是否存在重复记录