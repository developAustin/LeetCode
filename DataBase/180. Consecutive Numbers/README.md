solution思路
-------------

曾想能否通过统计计数的方式，没思路。。。最终还是用了用户变量<br>
变量count来统计每个num的连续数，变量preNum时刻指向前一个数<br>
对顺序的每条记录，倘若当前num=preNum，那么count+1，否则count重置为1，注意count更新之后才进行count>=3判断，若count>=3，输出num，否则输出null作为外查询的筛选标志，最后更新preNum<br>
最后，外查询将非null的值筛选出来去重(内查询只要>=3便输出，而且存在多处连续3个以上相同的数字，所以即便判断count=3，去重也是必须的)<br>
复杂了

更简单的解决方案
------------

简单明了，无需解释
```mysql
select distinct log1.num as ConsecutiveNums 
from logs log1,
logs log2,
logs log3
where log1.id=log2.id+1
and log1.id=log3.id+2
and log1.num=log2.num
and log1.num=log3.num
;
```