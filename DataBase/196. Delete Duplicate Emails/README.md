这里有一个思考点，如果只是查询出重复记录中id最小的记录，自然可以用子查询解决，但是要删除其他id更大的记录，显然要查询的是id更大的记录<br>
```mysql
select a.id,a.email
from person a,person b
where a.email=b.email and a.id>b.id
;
```

这里的a.id > b.id 条件很重要，如果要查询id更小的记录，显然是 a.id < b.id<br>
根据这个思路，只要删除这些记录就行<br>
```mysql
delete a from person a,person b
where a.email=b.email and a.id > b.id
;
```

这里有个关联删除的知识点，delete table_alias1,table_alias2... from table1 table_alias1 [inner|left|right join...] where ....