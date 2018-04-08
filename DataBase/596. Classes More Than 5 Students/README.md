count可以支持这样的语句hcount(distinct column)....<br>
这样更容易理解<br>
因为<br>
```mysql
select class,count(distinct student) from courses group by class
;
```
所以<br>
```mysql
select class from courses where count(distinct student)>=5 group by class
;
```