考察日期函数的运用
======================
DATEDIFF() 函数返回两个日期之间的天数
----------------
DATEDIFF(date1,date2)<br>
date1 和 date2 参数是合法的日期或日期/时间表达式。<br>

TO_DAYS() 函数返回从0年开始的天数
----------------
TO_DAYS(date)<br>
date1 参数是合法的日期或日期/时间表达式。<br>

SUBDATE() 函数从日期减去指定的时间间隔，是DATE_SUB()的同义词
--------------------
DATE_SUB(date,INTERVAL expr type)<br>
date 参数是合法的日期表达式。expr 参数是您希望添加的时间间隔。<br>

ADDDATE() 函数从日期减去指定的时间间隔，是DATE_ADD()的同义词
--------------------
DATE_ADD(date,INTERVAL expr type)<br>
date 参数是合法的日期表达式。expr 参数是您希望添加的时间间隔。<br>