这题是难度是hard，恩，难在题意，这就没意思了<br>
sql写复杂了，分别用了两个子查询查出未被禁止的客户发起的请求被取消数及总请求数<br>

简单的写法
------------
```mysql
select a.Request_at Day,round(sum(case when a.Status like 'cancelled_%' then 1 else 0 end)/count(1),2) 'Cancellation Rate'
from Trips a
inner join Users b on b.Banned ='No' and a.Client_Id =b.Users_Id
where a.Request_at between '2013-10-01' and '2013-10-03'
group by a.Request_at
;
```

知识点
-------
1、round(x,d) :用于数据的四舍五入,round(x)  ,其实就是round(x,0),也就是默认d为0；<br>
这里有个值得注意的地方是，d可以是负数，这时是指定小数点左边的d位整数位为0,同时小数位均为0；<br>
SELECT ROUND(100.3465,2),ROUND(100,2),ROUND(0.6,2),ROUND(114.6,-1);<br>
结果分别：100.35,100，0.6,110<br>
<br>
2、TRUNCATE(x,d)：函数返回被舍去至小数点后d位的数字x。若d的值为0，则结果不带有小数点或不带有小数部分。若d设为负数，则截去（归零）x小数点左起第d位开始后面所有低位的值。<br>
SELECT TRUNCATE(100.3465,2),TRUNCATE(100,2),TRUNCATE(0.6,2),TRUNCATE(114.6,-1);<br>
结果分别：100.34,100，0.6,110<br>
<br>
3、FORMAT（X,D）：强制保留D位小数，整数部分超过三位的时候以逗号分割，并且返回的结果是string类型的<br>
SELECT FORMAT(100.3465,2),FORMAT(100,2),FORMAT(,100.6,2);<br>
结果分别：100.35,100.00，100.60<br>