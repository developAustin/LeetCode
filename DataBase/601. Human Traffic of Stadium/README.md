主要思想是自己与自己做笛卡尔积，筛选出符合条件的记录<br>
```mysql
select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100
;
```
执行上面的SQL后，符合条件的记录组成的临时表表现为<br>
t1	t2	t3
				1<br>
		1		2<br>
				3<br>
				1<br>
1		2		2<br>
				3<br>
				1<br>
		3		2<br>
				3<br>
				1<br>
		1		2<br>
				3<br>
				1<br>
2		2		2<br>
				3<br>
				1<br>
		3		2<br>
				3<br>
				1<br>
		1		2<br>
				3<br>
				1<br>
3		2		2<br>
				3<br>
				1<br>
		3		2<br>
				3<br>
要把t1表的满足条件的记录都过滤出来，根据以上临时表，我们需要对不同位置的id做出不同的过滤策略：<br>
假设t1满足条件的一组id序列为 1,2,...,n(n>=3)<br>
1.id in 1,2,...,n-2<br>
这种情况较为简单(1,2,3)，条件为 t1.id=t2.id-1 and t2.id=t3.id-1<br>

------------------------

2.id = n<br>
这种情况也较为简单(3,2,1)，条件为 t1.id=t2.id+1 and t2.id=t3.id+1<br>

-----------------------

3.id = n-1<br>
可满足筛选出来的有两种情况：(2,3,1) (2,1,3) 皆可行<br>
t1.id=t2.id-1 and t1.id=t3.id+1 或 t1.id=t2.id+1 and t1.id=t3.id-1<br>


总结以上情况，要将满足条件记录过滤出来，需要将以上条件进行或运算即可<br>
```mysql
select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100
and
(
      (t1.id=t2.id-1 and t2.id=t3.id-1)  -- t1, t2, t3
    or
    (t1.id=t2.id+1 and t1.id=t3.id-1) -- t2, t1, t3
    or
    (t1.id=t2.id+1 and t2.id=t3.id+1) -- t3, t2, t1
)
order by t1.id
;
```